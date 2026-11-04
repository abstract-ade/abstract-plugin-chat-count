import Foundation
import Testing
@testable import AbstractCore

/// The Chat count sample, moved out of Abstract's own tests (ABS-190). CI
/// puts the package where Abstract's bundled plugins used to sit.
@Suite struct ChatCountPluginTests {
    var pluginFolder: URL {
        let here = URL(fileURLWithPath: #filePath)
        let repo = here.deletingLastPathComponent().deletingLastPathComponent()
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
        return repo.appendingPathComponent("Abstract/Resources/Plugins/chat-count.abstractplugin")
    }

    @Test func theManifestIsValid() throws {
        let inspection = try PluginPackage.inspect(folder: pluginFolder)
        #expect(inspection.manifest.id == "sh.abstract.chat-count")
        #expect(inspection.manifest.grantedCapabilities == [.chatsRead, .chatsOpen, .storageOwn])
    }
}
