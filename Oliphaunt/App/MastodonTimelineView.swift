import SwiftUI
import Manfred

struct MastodonTimelineView: View {
    @ObservedObject var controller: TimelineController

    var body: some View {
        List {
            ForEach(controller.statuses, id: \.id) { status in
                Text(status.content)
            }
        }
        .task {
            await controller.fetchPosts()
        }
    }
}
