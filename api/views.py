from back import settings
from .models import Note, User, Register
import joblib
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
import numpy as np
from rest_framework.decorators import api_view
from .serializers import NoteSerializer, UserSerializer, RegisterSerializer
from django.shortcuts import render
import tensorflow as tf
from django.http import JsonResponse
import json
from django.http import HttpResponse
import os
from rest_framework.decorators import api_view
from sklearn.preprocessing import MultiLabelBinarizer


@api_view(['GET'])
def getRoute(request):
    routes = [
        {
            'Endpoint': '/back/',
            'method': 'GET',
            'body': None,
            'description': 'Returns an array of notes',
        },
        {
            'Endpoint': '/back/id',
            'method': 'GET',
            'body': None,
            'description': 'Returns a single note object',
        },
        {
            'Endpoint': '/back/create/',
            'method': 'POST',
            'body': {'body': ""},
            'description': 'Create new notes',
        },
        {
            'Endpoint': '/back/id/update/',
            'method': 'PUT',
            'body': {'body': ""},
            'description': 'Updates an existing note with data',
        },
        {
            'Endpoint': '/back/id/delete/',
            'method': 'DELETE',
            'body': None,
            'description': 'Deletes an existing note',
        }
    ]
    return Response(routes)

@api_view(['GET'])
def getNotes(request):
    notes = Note.objects.all()
    serializer = NoteSerializer(notes, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def getNote(request, pk):
    note = Note.objects.get(id=pk)
    serializer = NoteSerializer(note, many=False)
    return Response(serializer.data)

@api_view(['POST'])
def createNote(request):
    serializer = NoteSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)

@api_view(['PUT'])
def updateNote(request, pk):
    note = Note.objects.get(id=pk)
    serializer = NoteSerializer(note, data=request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)

@api_view(['DELETE'])
def deleteNote(request, pk):
    note = Note.objects.get(id=pk)
    note.delete()
    return Response('Note was deleted')

@api_view(['GET'])
def getuser(request):
    user = User.objects.all()
    serializer = UserSerializer(user, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def getRegisters(request):
    registers = Register.objects.all()
    serializer = RegisterSerializer(registers, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def getRegister(request, pk):
    register = Register.objects.get(id=pk)
    serializer = RegisterSerializer(register, many=False)
    return Response(serializer.data)

@api_view(['POST'])
def createRegister(request):
    serializer = RegisterSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)

@api_view(['PUT'])
def updateRegister(request, pk):
    register = Register.objects.get(id=pk)
    serializer = RegisterSerializer(register, data=request.data)
    if serializer.is_valid():
        serializer.save()
    return Response(serializer.data)

@api_view(['DELETE'])
def deleteRegister(request, pk):
    register = Register.objects.get(id=pk)
    register.delete()
    return Response('Register was deleted')
# Load models and encoders

# Full list of symptoms
all_symptoms = [" belly_pain", " drying_and_tingling_lips", " anxiety", " continuous_sneezing", " pain_during_bowel_movements", " throat_irritation", " burning_micturition", " watering_from_eyes", " pain_behind_the_eyes", " unsteadiness", " dischromic _patches", " movement_stiffness", " joint_pain", " skin_rash", " yellowish_skin", " abdominal_pain", " weight_gain", " indigestion", " dark_urine", " fatigue", " back_pain", " distention_of_abdomen", " ulcers_on_tongue", " increased_appetite", " slurred_speech", " irregular_sugar_level", " yellow_crust_ooze", " muscle_wasting", " polyuria", " visual_disturbances", " yellow_urine", " sunken_eyes", " muscle_weakness", " irritability", " weakness_of_one_body_side", " loss_of_balance", " stomach_pain", " obesity", " sweating", " redness_of_eyes", " small_dents_in_nails", " high_fever", " scurring", " congestion", " fast_heart_rate", " weakness_in_limbs", " fluid_overload", " receiving_unsterile_injections", " loss_of_appetite", " chest_pain", " chills", " internal_itching"," prominent_veins_on_calf", " shivering", " yellowing_of_eyes", " inflammatory_nails", " palpitations", " passage_of_gases", " blood_in_sputum", " patches_in_throat", " swollen_blood_vessels", " pain_in_anal_region", " bruising", " puffy_face_and_eyes", " vomiting", " mucoid_sputum", " bladder_discomfort", " blackheads", " mood_swings", " phlegm", " altered_sensorium", " stomach_bleeding", " cough", " depression", " nausea", " hip_joint_pain", " restlessness", " brittle_nails", " lethargy", " breathlessness", " painful_walking", " acute_liver_failure", " knee_pain", " foul_smell_of urine", " diarrhoea", " loss_of_smell", " silver_like_dusting", " history_of_alcohol_consumption", " swelling_joints", "itching", " sinus_pressure", " excessive_hunger", " red_spots_over_body", " swelling_of_stomach", " mild_fever", " receiving_blood_transfusion", " swelled_lymph_nodes", " malaise", " extra_marital_contacts", " continuous_feel_of_urine", " constipation", " red_sore_around_nose"," dehydration", " dizziness", " family_history", " abnormal_menstruation", " lack_of_concentration", " neck_pain", " irritation_in_anus", " headache", " bloody_stool", " spinning_movements", " acidity", " runny_nose", " nodal_skin_eruptions", " enlarged_thyroid", " toxic_look_(typhos)", " swollen_legs", " skin_peeling", " cramps", " blister", " spotting_ urination", " weight_loss", " stiff_neck", " muscle_pain", " rusty_sputum", " cold_hands_and_feets", " blurred_and_distorted_vision", " pus_filled_pimples", " swollen_extremeties", " coma"]

# Train the MultiLabelBinarizer
mlb = MultiLabelBinarizer()
mlb.fit([all_symptoms])

# Save the updated encoder
joblib.dump(mlb, "symptom_encoder.pkl")
label_encoder = joblib.load("label_encoder.pkl")

# Initialize TensorFlow Lite interpreter
interpreter = tf.lite.Interpreter(model_path="disease_model.tflite")
interpreter.allocate_tensors()

# Get input and output details
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

@api_view(['POST'])
def predict_disease(request):
    symptoms = request.data.get('symptoms', [])
    
    # Filter out unknown symptoms
    known_symptoms = mlb.classes_
    valid_symptoms = [symptom for symptom in symptoms if symptom in known_symptoms]

    if not valid_symptoms:
        return Response({"error": "No valid symptoms provided."}, status=400)

    # Preprocess symptoms
    symptom_vector = mlb.transform([valid_symptoms]).astype(np.float32)
    symptom_vector = symptom_vector.reshape(1, -1)
    
    # Run inference
    interpreter.set_tensor(input_details[0]['index'], symptom_vector)
    interpreter.invoke()
    prediction = interpreter.get_tensor(output_details[0]['index'])[0]
    
    # Get top 3 predictions
    top_indices = np.argsort(prediction)[-3:][::-1]
    top_diseases = label_encoder.inverse_transform(top_indices)
    top_confidences = prediction[top_indices].tolist()
    
    # Format response
    results = [[disease, float(confidence)] 
            for disease, confidence in zip(top_diseases, top_confidences)]
    
    return Response(results)