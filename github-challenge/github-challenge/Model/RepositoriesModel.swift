//
//  RepositoriesModel.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct RepositoriesModel: Decodable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct Item: Decodable {
    let id: Int?
    let nodeID, name, fullName: String?
    let itemPrivate: Bool?
    let owner: Owner?
    let htmlURL: String?
    let itemDescription: String?
    let fork: Bool?
    let url, forksURL: String?
    let keysURL, collaboratorsURL: String?
    let teamsURL, hooksURL: String?
    let issueEventsURL: String?
    let eventsURL: String?
    let assigneesURL, branchesURL: String?
    let tagsURL: String?
    let blobsURL, gitTagsURL, gitRefsURL, treesURL: String?
    let statusesURL: String?
    let languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
    let subscriptionURL: String?
    let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String?
    let contentsURL, compareURL: String?
    let mergesURL: String?
    let archiveURL: String?
    let downloadsURL: String?
    let issuesURL, pullsURL, milestonesURL, notificationsURL: String?
    let labelsURL, releasesURL: String?
    let deploymentsURL: String?
    let createdAt, updatedAt, pushedAt: String?
    let gitURL, sshURL: String?
    let cloneURL: String?
    let svnURL: String?
    let homepage: String?
    let size, stargazersCount, watchersCount: Int?
    let language: Language?
    let hasIssues, hasProjects, hasDownloads, hasWiki: Bool?
    let hasPages: Bool?
    let forksCount: Int?
    let mirrorURL: JSONNull?
    let archived, disabled: Bool?
    let openIssuesCount: Int?
    let license: License?
    let forks, openIssues, watchers: Int?
    let defaultBranch: DefaultBranch?
    let score: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case itemPrivate = "private"
        case owner
        case htmlURL = "html_url"
        case itemDescription = "description"
        case fork, url
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case gitURL = "git_url"
        case sshURL = "ssh_url"
        case cloneURL = "clone_url"
        case svnURL = "svn_url"
        case homepage, size
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case forksCount = "forks_count"
        case mirrorURL = "mirror_url"
        case archived, disabled
        case openIssuesCount = "open_issues_count"
        case license, forks
        case openIssues = "open_issues"
        case watchers
        case defaultBranch = "default_branch"
        case score
    }
}

enum DefaultBranch: String, Decodable {
    case develop = "develop"
    case development = "development"
    case master = "master"
}

enum Language: String, Decodable {
    case swift = "Swift"
}

// MARK: - License
struct License: Decodable {
    let key: Key?
    let name: Name?
    let spdxID: SpdxID?
    let url: String?
    let nodeID: NodeID?

    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID = "spdx_id"
        case url
        case nodeID = "node_id"
    }
}

enum Key: String, Decodable {
    case apache20 = "apache-2.0"
    case cc010 = "cc0-1.0"
    case gpl30 = "gpl-3.0"
    case mit = "mit"
    case other = "other"
}

enum Name: String, Decodable {
    case apacheLicense20 = "Apache License 2.0"
    case creativeCommonsZeroV10Universal = "Creative Commons Zero v1.0 Universal"
    case gnuGeneralPublicLicenseV30 = "GNU General Public License v3.0"
    case mitLicense = "MIT License"
    case other = "Other"
}

enum NodeID: String, Decodable {
    case mDc6TGljZW5ZZTA = "MDc6TGljZW5zZTA="
    case mDc6TGljZW5ZZTEz = "MDc6TGljZW5zZTEz"
    case mDc6TGljZW5ZZTI = "MDc6TGljZW5zZTI="
    case mDc6TGljZW5ZZTY = "MDc6TGljZW5zZTY="
    case mDc6TGljZW5ZZTk = "MDc6TGljZW5zZTk="
}

enum SpdxID: String, Decodable {
    case apache20 = "Apache-2.0"
    case cc010 = "CC0-1.0"
    case gpl30 = "GPL-3.0"
    case mit = "MIT"
    case noassertion = "NOASSERTION"
}

// MARK: - Owner
struct Owner: Decodable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: TypeEnum?
    let siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

enum TypeEnum: String, Decodable {
    case organization = "Organization"
    case user = "User"
}

// MARK: - Encode/decode helpers

class JSONNull: Decodable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        default:
             return hasher.combine(0)
        }
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self,
                DecodingError.Context(codingPath: decoder.codingPath,
                                      debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
