from import_export import resources
from .models import StudentsList

class StudentsListResource(resources.ModelResource):
    class Meta:
        model = StudentsList