abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    // To be overridden by subclasses
  }
}

class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;

  Student(
    String name,
    int age,
    String address,
    this.studentID,
    this.grade,
    this.courseScores,
  ) : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    double totalScore = courseScores.fold(0, (sum, score) => sum + score);
    return totalScore / courseScores.length;
  }

  void displayStudentInfo() {
    print("Student Information:");
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Average Score: ${calculateAverageScore().toStringAsFixed(1)}");
  }
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(
    String name,
    int age,
    String address,
    this.teacherID,
    this.coursesTaught,
  ) : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayTeacherInfo() {
    print("Teacher Information:");
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}

void main() {
  // Create a Student instance
  Student student = Student(
    "John Doe",
    20,
    "123 Main St",
    "S123",
    "A",
    [90, 85, 82],
  );

  // Display Student Information
  student.displayStudentInfo();
  print("");

  // Create a Teacher instance
  Teacher teacher = Teacher(
    "Mrs. Smith",
    35,
    "456 Oak St",
    "T456",
    ["Math", "English", "Bangla"],
  );

  // Display Teacher Information
  teacher.displayTeacherInfo();
}
