FHIRModels
==========

![0.1.0](https://img.shields.io/badge/Latest-0.1.0-blueviolet.svg?style=flat) ![🔥 FHIR DSTU-2, R4, build](https://img.shields.io/badge/🔥_FHIR-DSTU2_•%20R4_•%20β4.4-orange.svg?style=flat) ![Works on macOS, iOS, watchOS and tvOS](https://img.shields.io/badge/Platform-macOS_•%20iOS_•%20watchOS_•%20tvOS-blue.svg?style=flat) [![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg?style=flat)][spm] [![License](https://img.shields.io/badge/License-APACHE_2.0-lightgrey.svg?style=flat)](#license)

FHIRModels is a Swift library for [FHIR®][fhir] resource data models.

## Features

- Native Swift representation of FHIR resources, elements and data types
- Separate targets for DSTU2, R4 and latest build versions
- Enforced non-nullability of mandatory parameters
- Enums for most closed code systems
- Enums to support value[x] types
- Date/Time parsing and validation
- Swift Codable support

## Requirements

FHIRModels works with Swift 5.0 and newer.

## Installation

[Swift Package Manager][spm] is the recommended way to add FHIRModels to your project:

1. In Xcode 11, go to “File” » “Swift Package Management” » “Add Package Dependency...”
2. Search for "FHIRModels" in the panel that comes up or paste the full URL to the GitHub repository, then select the package
3. Pick the versioning that best works for you (usually the current version and "up to next major")
4. In order to update the dependency, periodically select “Update to Latest Package Versions” from Xcode 11's “File” » “Swift Package Management” menu

Alternatively, you can add FHIRModels to your `Package.swift` file as a dependency:

```swift
dependencies: [
    .package(url: "https://github.com/apple/FHIRModels.git",
            .upToNextMajor(from: "0.1.0"))
]
```

Usage
=====

## Instantiate FHIR Models

Assuming you have data that you know represents a FHIR resource, you have two options of instantiating a model. We'll assume you have JSON data for the examples below.

### 1. Use ResourceProxy

The `ResourceProxy` type inspects the `resourceType` in the data and instantiates the appropriate class for you:

```swift
import ModelsR4

let data = <FHIR JSON data>
let decoder = JSONDecoder()
do {
    let proxy = try decoder.decode(ResourceProxy.self, from: data)
    
    let resource = proxy.get()
    // `resource` is a generic `Resource`
    
    let patient = proxy.get(if: Patient.self)
    // `patient` is a nullable `Patient`
    
    if case .patient(let patient) = proxy {
        // `patient` is a `Patient`
    }
    
    switch proxy {
    case .patient(let patient):
        // `patient` is a `Patient`
        break
    default:
        break
    }
} catch {
    print("Failed to instantiate: \(error)")
}
```

### 2. Decode to known Resource

If you think you know the correct resource type already:

```swift
import ModelsR4

let data = <FHIR JSON data>
let decoder = JSONDecoder()
do {
    let resource = try decoder.decode(Patient.self, from: data)
} catch {
    print("Failed to instantiate Patient: \(error)")
}
```

## Model Properties

FHIR Resource and Element types are represented as Swift classes,
primitive data types are represented as structs.
All primitives are defined as `FHIRPrimitive`,
genericized to the appropriate type such as `FHIRBool` or `DateTime`.

### Patient with a name

The library makes extensive use of `ExpressibleBy{Type}Literal` so you can take shortcuts when instantiating primitives.
For example, `HumanName.given` is an Array of `FHIRPrimitive<FHIRString>` that can be instantiated as follows:

```swift
import ModelsR4

let name = HumanName(family: "Altick", given: ["Kelly"])
let patient = Patient(name: [name])

name.given?.first                   // FHIRPrimitive<FHIRString>?
name.given?.first?.value            // FHIRString?
name.given?.first?.value?.string    // String?
```

### Date & Time

FHIRModels handles date/time ↔︎ string conversion transparently and will discard invalid dates.

```swift
do {
    let dateTimeString = "2020-03-12T12:33:54.6543-06:00"
    let dateTime = try DateTime(dateTimeString)
    dateTime.date.year == 2020
    dateTime.time.minute == 33
    dateTime.timeZone == TimeZone(secondsFromGMT: -6 * 3600)
} catch {
    print("Failed to parse date time string: \(error)")
}
```

---

Getting Involved
================

Please feel free to open [GitHub issues][issues] for questions, suggestions or issues you may have.
Because the majority of the codebase is generated we will not be able to accept Pull Requests at this time.

License
=======

This work is [APACHE 2.0 licensed](./LICENSE).

FHIR® is the registered trademark of HL7 and is used with the permission of HL7. Use of the FHIR trademark does not constitute endorsement of this product by HL7.

[fhir]: https://hl7.org/fhir
[issues]: https://github.com/apple/FHIRModels/issues
[spm]: https://github.com/apple/swift-package-manager
