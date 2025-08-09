# 🚀 Subagent Quick Reference Card

## How to Deploy a Subagent

Use the Task tool with two parameters:
1. `prompt`: The task description
2. `subagent_type`: The specialist agent type

Example:
```
Task tool with prompt="Debug the memory leak in payment processing" and subagent_type="debugger"
```

## Top Subagents by Category

### 🔧 Development
- `frontend-developer` - React, Vue, Angular UI work
- `backend-developer` - APIs, server logic, databases
- `fullstack-developer` - End-to-end features
- `mobile-app-developer` - iOS/Android apps

### 🧪 Testing & Quality
- `qa-expert` - Test strategy and planning
- `test-automator` - Automated test creation
- `performance-engineer` - Speed optimization
- `penetration-tester` - Security testing

### 🔍 Research & Analysis
- `research-analyst` - General research
- `search-specialist` - Finding specific info
- `data-researcher` - Data analysis
- `competitive-analyst` - Market research

### 🛠️ Infrastructure
- `devops-engineer` - CI/CD, deployment
- `cloud-architect` - AWS, Azure, GCP
- `kubernetes-specialist` - K8s management
- `terraform-engineer` - Infrastructure as code

### 📝 Code Quality
- `code-reviewer` - Code review and standards
- `refactoring-specialist` - Code improvement
- `debugger` - Bug investigation
- `error-detective` - Error pattern analysis

### 📚 Documentation
- `technical-writer` - Documentation
- `api-documenter` - API documentation
- `documentation-engineer` - Doc systems

## Common Use Cases

### When PM is Overwhelmed
```bash
./suggest_subagent.sh project:0 pm "handling multiple features"
```
Suggest: `developer`, `qa-expert`, `technical-writer`

### When Developer is Stuck
```bash
./suggest_subagent.sh backend:0 developer "debugging for 30+ minutes"
```
Suggest: `debugger`, `error-detective`, `search-specialist`

### When Starting New Feature
Suggest multiple agents:
- `research-analyst` - Research best practices
- `frontend-developer` - UI implementation
- `backend-developer` - API implementation
- `test-automator` - Test creation

### When Performance Issues
Deploy immediately:
- `performance-engineer` - Profile and optimize
- `database-optimizer` - Query optimization
- `cache-engineer` - Caching strategies

## Quick Commands for Orchestrator

### Send Subagent Suggestion
```bash
# For Project Manager
./suggest_subagent.sh session:window pm "context"

# For Developer
./suggest_subagent.sh session:window developer "context"

# General suggestion
./suggest_subagent.sh session:window general
```

### Check Agent Activity
```bash
# See what agent is doing
tmux capture-pane -t session:window -p | tail -50

# Check for signs they need help
# Look for: "struggling", "stuck", "complex", "multiple", "overwhelmed"
```

### Schedule Reminders
```bash
# Schedule subagent reminder check
./schedule_with_note.sh 30 "Check if agents need subagent help" "tmux-orc:0"
```

## Golden Rules

1. **Parallel > Sequential**: Always prefer parallel execution
2. **Specialize**: Use the right expert for each task
3. **Delegate Early**: Don't wait until overwhelmed
4. **Monitor**: Check agent workload every 30 minutes
5. **Encourage**: Proactively suggest subagents

## Emergency Deployment

When critical issues arise, deploy multiple specialists immediately:

```
Task tool with prompt="CRITICAL: Production database is down" and subagent_type="database-administrator"
Task tool with prompt="CRITICAL: Monitor system health" and subagent_type="sre-engineer"
Task tool with prompt="CRITICAL: Check for security breach" and subagent_type="security-engineer"
Task tool with prompt="CRITICAL: Communicate with stakeholders" and subagent_type="incident-responder"
```

## Remember

**Every complex task can be parallelized.**
**Every bottleneck can be distributed.**
**Every agent can be more effective with help.**

Use subagents liberally - they're your force multipliers!