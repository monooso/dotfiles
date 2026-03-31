---
name: Plan Writer
description: Converts a set of product requirements to a multi-phase implementation plan using tracer-bullet vertical slices. Saves the plan as a Markdown file in ./plans/. Use when user wants to break down a set of requirements, create an implementation plan, plan phases from a PRD, or mentions "tracer bullets".
---

# Convert requirements to an implementation plan

Convert a set of product requirements to phased implementation plan using vertical slices (tracer bullets). Write the plan as an appropriately-named Markdown file to `./plans/`.

## Process

### 1. Confirm the requirements are in the context
The requirements should already be in the conversation. If not, ask the user to paste them or point you to a file.

### 2. Explore the codebase
If you have not already explored the codebase, do so to understand the current architecture, existing patterns, and integration layers.

### 3. Identify durable architectural decisions
Before slicing, identify high-level decisions that are unlikely to change throughout implementation:

- Route structures / URL patterns
- Database schema shape
- Key data models
- Authentication / authorization approach
- Third-party service boundaries

These go in the plan header so every phase can reference them.

### 4. Draft vertical slices
Break the requirements into **tracer bullet** phases. Each phase is a thin vertical slice that cuts through ALL integration layers end-to-end, NOT a horizontal slice of one layer.

<vertical-slice-rules>
- Each slice delivers a narrow but COMPLETE path through every layer (schema, API, UI, tests)
- A completed slice is demoable or verifiable on its own
- Prefer many thin slices over few thick ones
- Do NOT include specific file names, function names, or implementation details that are likely to change as later phases are built
- DO include durable decisions: route paths, schema shapes, data model names
</vertical-slice-rules>

### 5. Quiz the user
Present the proposed breakdown as a numbered list. For each phase show:

- **Title**: short descriptive name
- **Features covered**: which features / user stories from the requirements this addresses

Ask the user:

- Does the granularity feel right? (too coarse / too fine)
- Should any phases be merged or split further?

Iterate until the user approves the breakdown.

### 6. Write the plan file
Create `./plans/` if it doesn't exist. Write the plan as a Markdown file named after the feature (e.g. `./plans/user-onboarding.md`). Use the template below.

<plan-template>
# Plan: {{ feature_name }}

## Requirements
Write the full requirements here. You may reword for brevity and clarity, but MUST NOT change the meaning or discard any important information.

## Architectural decisions
Durable decisions that apply across all phases:

- **Routes**: ...
- **Schema**: ...
- **Key models**: ...
- (add/remove sections as appropriate)

## Progress
A checklist of the plan steps. Use this list to keep track of your progress. Update the checklist whenever a step is completed, and commit this document as part of the code changes.

- [ ] Step 1: {{ title }}
- [ ] Step 2: {{ title }}
- ...

## Step 1: {{ title }}
A concise description of this vertical slice. Describe the end-to-end behavior, not layer-by-layer implementation.

### Acceptance criteria

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

---

## Step 2: {{ title }}
A concise description of this vertical slice. Describe the end-to-end behavior, not layer-by-layer implementation.

### Acceptance criteria

- [ ] ...

<!-- Repeat for each phase -->
</plan-template>

## Notes to self
Update this section as you progress through the plan. Record any unexpected findings, or things which may be of use to you in future steps.
