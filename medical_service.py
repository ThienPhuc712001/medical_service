import mysql.connector
from datetime import datetime

# Kết nối tới cơ sở dữ liệu
def connect_to_database():
    return mysql.connector.connect(
        host="localhost",          # Đổi thành host của bạn nếu không phải localhost
        user="root",               # Đổi thành user của bạn
        password="",       # Đổi thành mật khẩu của bạn
        database="medical_service" # Tên database đã tạo
    )

# Hiển thị lịch hẹn ngày hôm nay
def show_today_appointments(cursor):
    query = """
    SELECT 
        patients.address, patients.full_name, patients.date_of_birth, patients.gender, 
        doctors.full_name AS doctor_name, appointments.reason, appointments.status
    FROM appointments
    JOIN patients ON appointments.patient_id = patients.patient_id
    JOIN doctors ON appointments.doctor_id = doctors.doctor_id
    WHERE DATE(appointments.appointment_date) = CURDATE()
    """
    cursor.execute(query)
    appointments = cursor.fetchall()
    print("Today's Appointments:")
    print("=" * 50)
    for row in appointments:
        print(f"Address: {row[0]}, Patient: {row[1]}, DOB: {row[2]}, Gender: {row[3]}, "
              f"Doctor: {row[4]}, Reason: {row[5]}, Status: {row[6]}")
    print("=" * 50)

# Chương trình chính
def main():
    try:
        # Kết nối tới cơ sở dữ liệu
        conn = connect_to_database()
        cursor = conn.cursor()

        # Hiển thị lịch hẹn hôm nay
        show_today_appointments(cursor)

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

if __name__ == "__main__":
    main()
