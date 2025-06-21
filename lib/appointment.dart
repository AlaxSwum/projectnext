import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  int selectedDay = 9;
  String selectedTime = '16:00 pm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Choose Appointment',
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Month navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () {},
                  ),
                  Text(
                    'April',
                    style: GoogleFonts.urbanist(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () {},
                  ),
                ],
              ),
              
              // Calendar days of week
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildDayLabel('Mon'),
                    _buildDayLabel('Tue'),
                    _buildDayLabel('Wed'),
                    _buildDayLabel('Thu'),
                    _buildDayLabel('Fri'),
                    _buildDayLabel('Sat'),
                    _buildDayLabel('Sun'),
                  ],
                ),
              ),
              
              // Calendar dates
              SizedBox(
                height: 200,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: 35, // 5 weeks
                  itemBuilder: (context, index) {
                    // First row starts with 1, 2, 3...
                    // Second row starts with 8, 9, 10...
                    int day = index + 1;
                    
                    // Adjust for April starting on a specific day
                    // For this example, we'll assume April starts on a Saturday (index 5)
                    // So we need to offset the first few days
                    if (index < 5) {
                      day = index - 5 + 31; // Show last days of March
                    } else if (index >= 5) {
                      day = index - 5 + 1; // April days
                    }
                    
                    // Only show days 1-30 for April
                    bool isCurrentMonth = day >= 1 && day <= 30;
                    
                    // For days outside current month range
                    if (day > 30) {
                      day = day - 30; // May days
                      isCurrentMonth = false;
                    } else if (day < 1) {
                      isCurrentMonth = false;
                    }
                    
                    return _buildDateCell(day, isCurrentMonth);
                  },
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Time Available section
              Text(
                'Time Available',
                style: GoogleFonts.urbanist(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Time slots - Morning
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeSlot('06:00 am'),
                  _buildTimeSlot('07:00 am'),
                  _buildTimeSlot('08:00 am'),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Time slots - Late Morning
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeSlot('09:00 am'),
                  _buildTimeSlot('10:00 am'),
                  _buildTimeSlot('11:00 am'),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Time slots - Afternoon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeSlot('12:00 am'),
                  _buildTimeSlot('13:00 pm'),
                  _buildTimeSlot('14:00 pm'),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Time slots - Late Afternoon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeSlot('15:00 pm'),
                  _buildTimeSlot('16:00 pm', isSelected: true),
                  _buildTimeSlot('17:00 pm'),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Appointment details
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.attach_money,
                      color: Colors.grey,
                      size: 28,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Leg Truma',
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '\$45',
                          style: GoogleFonts.urbanist(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Book Now button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2663FF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'BOOK NOW',
                    style: GoogleFonts.urbanist(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  Widget _buildDayLabel(String day) {
    return Text(
      day,
      style: GoogleFonts.urbanist(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }

  Widget _buildDateCell(int day, bool isCurrentMonth) {
    bool isSelected = isCurrentMonth && day == selectedDay;
    
    return GestureDetector(
      onTap: () {
        if (isCurrentMonth) {
          setState(() {
            selectedDay = day;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2663FF) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            day.toString(),
            style: GoogleFonts.urbanist(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? Colors.white
                  : isCurrentMonth
                      ? Colors.black
                      : Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlot(String time, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = time;
        });
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: time == selectedTime
              ? const Color(0xFF2663FF)
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            time,
            style: GoogleFonts.urbanist(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: time == selectedTime ? Colors.white : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }
}