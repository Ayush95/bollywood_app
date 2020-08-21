// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

class Welcome {
    Welcome({
        this.nodes,
    });

    List<NodeElement> nodes;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        nodes: List<NodeElement>.from(json["nodes"].map((x) => NodeElement.fromJson(x))),
    );
}

class NodeElement {
    NodeElement({
        this.node,
    });

    NodeNode node;

    factory NodeElement.fromJson(Map<String, dynamic> json) => NodeElement(
        node: NodeNode.fromJson(json["node"]),
    );
}

class NodeNode {
    NodeNode({
        this.title,
        this.nidDontUse,
        this.fieldPhotoImageSection,
        this.path,
        this.nid,
    });

    String title;
    String nidDontUse;
    String fieldPhotoImageSection;
    String path;
    String nid;

    factory NodeNode.fromJson(Map<String, dynamic> json) => NodeNode(
        title: json["title"],
        nidDontUse: json["nid_dont_use"],
        fieldPhotoImageSection: "http://www.pinkvilla.com/" + json["field_photo_image_section"],
        path: json["path"],
        nid: json["nid"],
    );
}
