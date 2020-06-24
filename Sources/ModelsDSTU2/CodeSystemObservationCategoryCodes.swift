//
//  CodeSystems.swift
//  HealthRecords
//
//  Generated from FHIR 1.0.2.7202
//  Copyright 2020 Apple Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import FMCore

/**
 Observation Category codes.
 
 URL: http://hl7.org/fhir/observation-category
 ValueSet: http://hl7.org/fhir/ValueSet/observation-category
 */
public enum ObservationCategoryCodes: String, FHIRPrimitiveType {
	
	/// The Social History Observations define the patient's occupational, personal (e.g. lifestyle), social, and
	/// environmental history and health risk factors, as well as administrative data such as marital status, race,
	/// ethnicity and religious affiliation.
	case socialHistory = "social-history"
	
	///  Clinical observations measure the body's basic functions such as such as blood pressure, heart rate,
	/// respiratory rate, height, weight, body mass index, head circumference, pulse oximetry, temperature, and body
	/// surface area.
	case vitalSigns = "vital-signs"
	
	/// Observations generated by imaging. The scope includes observations, plain x-ray, ultrasound, CT, MRI,
	/// angiography, echocardiography, nuclear medicine.
	case imaging = "imaging"
	
	/// The results of observations generated by laboratories.  Laboratory results are typically generated by
	/// laboratories providing analytic services in areas such as chemistry, hematology, serology, histology, cytology,
	/// anatomic pathology, microbiology, and/or virology. These observations are based on analysis of specimens
	/// obtained from the patient and submitted to the laboratory.
	case laboratory = "laboratory"
	
	/// Observations generated by other procedures.  This category includes observations resulting from interventional
	/// and non-interventional procedures excluding lab and imaging (e.g. cardiology catheterization, endoscopy,
	/// electrodiagnostics, etc.).  Procedure results are typically generated by a clinician to provide more granular
	/// information about component observations made during a procedure, such as where a gastroenterologist reports the
	/// size of a polyp observed during a colonoscopy.
	case procedure = "procedure"
	
	/// Assessment tool/survey instrument observations (e.g. Apgar Scores, Montreal Cognitive Assessment (MoCA))
	case survey = "survey"
	
	/// Observations generated by physical exam findings including direct observations made by a clinician and use of
	/// simple instruments and the result of simple maneuvers performed directly on the patient's body.
	case exam = "exam"
	
	/// Observations generated by non-interventional treatment protocols (e.g. occupational, physical, radiation,
	/// nutritional and medication therapy)
	case therapy = "therapy"
}