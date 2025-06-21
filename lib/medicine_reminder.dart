import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineReminder extends StatelessWidget {
  const MedicineReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Medication Reminder',
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2663FF),
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2663FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          'June 2022',
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildDateCell('Mon', '20'),
                        _buildDateCell('Tue', '21'),
                        _buildDateCell('Wed', '22'),
                        _buildDateCell('Thu', '23', isSelected: true),
                        _buildDateCell('Fri', '24'),
                        _buildDateCell('Sat', '25'),
                        _buildDateCell('Sun', '26'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Dosage',
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1E232C),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTimelineItem(
                        time: '09:00 am',
                        medicine: 'Cough Mixture',
                        dosage: '1 spoon after meal',
                        isCompleted: false,
                        isCancelled: true,
                      ),
                      _buildTimelineItem(
                        time: '10:00 am',
                        medicine: 'Muscle Relaxants',
                        dosage: '1 tablet after meal',
                        isCompleted: true,
                      ),
                      _buildTimelineItem(
                        time: '11:00 am',
                        medicine: 'Blood Thinner',
                        dosage: '1 tablet after meal',
                        isCompleted: true,
                      ),
                      _buildTimelineItem(
                        time: '12:00 am',
                        medicine: 'Cell Regenerator',
                        dosage: '1 dose before meal',
                      ),
                      _buildTimelineItem(
                        time: '01:00 pm',
                        medicine: 'Pain Relief Needle',
                        dosage: '1 dose before meal',
                      ),
                      _buildTimelineItem(
                        time: '02:00 pm',
                        medicine: 'Blood Pressure Medicine',
                        dosage: '1 spoon after meal',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateCell(String day, String date, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration:
          isSelected
              ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              )
              : null,
      child: Column(
        children: [
          Text(
            day,
            style: GoogleFonts.urbanist(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? const Color(0xFF2663FF) : Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: GoogleFonts.urbanist(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? const Color(0xFF2663FF) : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String time,
    required String medicine,
    required String dosage,
    bool isCompleted = false,
    bool isCancelled = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                time,
                style: GoogleFonts.urbanist(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1E232C),
                ),
              ),
              Container(width: 2, height: 80, color: const Color(0xFF2663FF)),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color:
                    isCancelled
                        ? const Color(0xFFFEEFEF)
                        : isCompleted
                        ? const Color(0xFFEFF6FF)
                        : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:
                      isCancelled
                          ? const Color(0xFFFFE5E5)
                          : isCompleted
                          ? const Color(0xFFDCEAFE)
                          : Colors.grey.shade200,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        medicine,
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E232C),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dosage,
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  if (isCompleted)
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2663FF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      ),
                    )
                  else if (isCancelled)
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF4949),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
