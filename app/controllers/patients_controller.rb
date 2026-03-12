class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show edit update destroy ]

  def index
    @patients = Current.user.patients
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def edit
  end

  def create
    @patient = Current.user.patients.build(patient_params)

    if @patient.save
      redirect_to @patient, notice: "Paciente cadastrado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: "Paciente atualizado com sucesso.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy!
    redirect_to patients_path, notice: "Paciente removido.", status: :see_other
  end

  private

  def set_patient
    @patient = Current.user.patients.find(params[:id])
  end

  def patient_params
    params.expect(patient: [ :name, :birth_date, :email, :phone, :description ])
  end
end
