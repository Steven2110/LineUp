//
//  LUAddView.swift
//  LineUp
//
//  Created by Steven Wijaya on 24.02.2023.
//

import SwiftUI

struct LUAddView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var list: [LUItem]
    
    @State var taskName: String = ""
    @State var labelIcon: String = "😎"
    
    @State var selectedDay: [DayOfTheWeek] = [DayOfTheWeek]()
    
    @State var addTimeReminder: Bool = true
    @State var timeReminder: Date = Date.now
    
    @State var customReminderText: String = ""
    
    @State private var showingSheet: Bool = false
    
    var body: some View {
        VStack {
            LUTaskName(taskName: $taskName)
            Divider()
            HStack {
                Text("Label").fixedSize()
                Spacer()
                Text(labelIcon)
            }.padding([.top, .bottom])
            .onTapGesture {
                showingSheet.toggle()
            }
            Divider()
            ReminderSectionTitle()
            DayReminderPicker(selectedDay: $selectedDay)
            Toggle(isOn: $addTimeReminder) { Text("Reminder time") }
            if addTimeReminder {
                HStack {
                    DatePicker("", selection: $timeReminder, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .colorMultiply(.brandPrimary)
                    TextField("Custom Notification Text", text: $customReminderText)
                        .padding(.leading, 10)
                        .frame(height: 35)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.brandSecondary)
                        }
                }
            }
            Spacer()
            Button {
                if isValidItem() {
                    list.append(LUItem(name: taskName, labelIcon: labelIcon, reminderDay: selectedDay))
                }
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .frame(width: 100)
                    .padding()
                    .background(Color.brandPrimary)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(10)
        .navigationTitle("Add LineUp")
        .toolbar {
            Button { dismissKeyboard() } label: {
                Image(systemName: "keyboard.chevron.compact.down")
            }
        }
        .sheet(isPresented: $showingSheet) {
            LULabelPicker(selectedEmoji: $labelIcon)
                .presentationDetents([.fraction(0.4)])
        }
    }
}

struct LUTaskName: View {
    
    @Binding var taskName: String
    
    var body: some View {
        HStack {
            Text("LineUp task")
                .font(.title3)
            Spacer()
            TextField("LineUp Task", text: $taskName)
            .frame(width: 200)
            .multilineTextAlignment(.trailing)
        }.padding([.top, .bottom])
    }
}

struct ReminderSectionTitle: View {
    var body: some View {
        HStack {
            Text("LineUp reminder")
            Spacer()
            Text("Notification to do LineUp task")
                .font(.caption2)
                .foregroundColor(.brandSecondary)
        }.padding([.top, .bottom])
    }
}

struct DayReminderPicker: View {
    
    private let days: [DayOfTheWeek] = DayOfTheWeek.daysOfTheWeek
    @Binding var selectedDay: [DayOfTheWeek]
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(days) { day in
                RoundedRectangle(cornerRadius: 10)
                    .fill(selectedDay.contains(day) ? Color.brandPrimary : Color.brandSecondary)
                    .frame(width: 40, height: 40)
                    .overlay {
                        Text(day.shortValue)
                    }
                    .onTapGesture {
                        if selectedDay.contains(day) {
                            selectedDay.removeAll{ $0 == day }
                        } else {
                            selectedDay.append(day)
                        }
                    }
            }
        }
        .padding(.bottom)
    }
}

struct LUAddView_Previews: PreviewProvider {
    static var previews: some View {
        LUAddView(list: .constant([LUItem]()))
    }
}

extension LUAddView {
    private func isValidItem() -> Bool {
        taskName != "" && labelIcon != "" && !selectedDay.isEmpty
    }
}
