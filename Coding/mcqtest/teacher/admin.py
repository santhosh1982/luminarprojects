from import_export.admin import ImportExportModelAdmin
from django.contrib import admin
from .models import StudentsList

@admin.register(StudentsList)
class StudentsListAdmin(ImportExportModelAdmin):
    pass