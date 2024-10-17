import QtQuick3D 1.12
import QtQuick 2.12

Node {
    id: arrow_obj
    rotationOrder: Node.XYZr
    orientation: Node.RightHanded

    Model {
        id: ___2
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/___2.mesh"

        DefaultMaterial {
            id: default_material
            diffuseColor: "#ff999999"
        }
        materials: [
            default_material
        ]
    }

    Model {
        id: ___1
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/___1.mesh"
        materials: [
            default_material
        ]
    }

    Model {
        id: ___1_1
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/___1_1.mesh"
        materials: [
            default_material
        ]
    }

    Model {
        id: ___2_1
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/___2_1.mesh"
        materials: [
            default_material
        ]
    }

    Model {
        id: ___2_2
        rotationOrder: Node.XYZr
        orientation: Node.RightHanded
        source: "meshes/___2_2.mesh"
        materials: [
            default_material
        ]
    }
}
