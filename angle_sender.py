import csv
import serial
import time

# Replace 'COM3' with the serial port your Arduino is connected to
arduino_port = 'COM7'
baud_rate = 115200

# Replace 'angles.csv' with the path to your CSV file
csv_file_path = 'angles.txt'

def load_angles_from_csv(file_path):
    angles = []
    with open(file_path, mode='r') as file:
        csv_reader = csv.reader(file)
        for row in csv_reader:
            angles.append(row)  # Add the row (list of angles) to the angles list
    return angles

def send_angles_to_arduino(serial_port, angles, cycles):
    with serial.Serial(serial_port, baud_rate, timeout=1) as arduino:
        time.sleep(2)  # Wait for the connection to establish
        for i in range(cycles):
            for angle_set in angles:
                angle_str = ' '.join(angle_set) + '\n'  # Convert list of angles to a space-separated string
                arduino.write(angle_str.encode())  # Encode the string and send it over serial
                print(f"Sent angles: {angle_str.strip()}")
                time.sleep(0.001)  # Wait a bit for Arduino to process the command

if __name__ == "__main__":
    angles = load_angles_from_csv(csv_file_path)
    send_angles_to_arduino(arduino_port, angles, 5)
