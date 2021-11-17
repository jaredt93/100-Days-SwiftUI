//
//  CrewView.swift
//  Moonshot
//
//  Created by Jared Tamulynas on 11/13/21.
//

import SwiftUI

struct CrewView: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct CrewView_Previews: PreviewProvider {
    static let crew: [CrewMember] = [CrewMember(role: "role", astronaut: Astronaut(id: "grissom", name: "Jared T", description: "Boss")), CrewMember(role: "role", astronaut: Astronaut(id: "grissom", name: "Jared T", description: "Boss"))]
    
    static var previews: some View {
        CrewView(crew: crew)
            .preferredColorScheme(.dark)
    }
}
