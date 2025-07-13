// Create a class named  Candidate with Candidate_ID, Candidate_Name.Candidate_Age,Candidate_Weight and Candidate_Height data members.
// Also Create a method GetCandidateDetails() and DisplayCandidateDetails(). Create main method to demonstrate the Candidate class.

import 'dart:io';
void main(){
  Candidate c1=new Candidate();
  c1.GetCandidateDetails();
  c1.DisplayCandidateDetails();
}

class Candidate{
  int CandidateId=0;
  String CandidateName="";
  int CandidateAge=0;
  double Candidate_Weight=0;
  double Candidate_Height=0;

  void GetCandidateDetails(){
    print("Enter Candidate Id:");
    CandidateId=int.parse(stdin.readLineSync()!);
    print("Enter Candidate Name:");
    CandidateName=stdin.readLineSync()!;
    print("Enter Candidate Age:");
    CandidateAge=int.parse(stdin.readLineSync()!);
    print("Enter Candidate Weight");
    Candidate_Weight=double.parse(stdin.readLineSync()!);
    print("Enter Candidate Height");
    Candidate_Height=double.parse(stdin.readLineSync()!);
  }
  void DisplayCandidateDetails(){
    print("Candidate Id: $CandidateId");
    print("Candidate Name: $CandidateName");
    print("Candidate Age: $CandidateAge");
    print("Candidate Weight: $Candidate_Weight");
    print("Candidate Height: $Candidate_Height");
  }

}