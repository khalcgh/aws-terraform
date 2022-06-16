const output = `#### Terraform Format and Style 🖌\`${{ steps.fmt.outcome }}\`
#### Terraform Initialization ⚙️\`${{ steps.init.outcome }}\`
#### Terraform Plan 📖\`${{ steps.plan.outcome }}\`
#### Terraform Validation 🤖\`${{ steps.validate.outcome }}\`

<details><summary>Show Plan</summary>

\`\`\`\n
${process.env.PLAN}
\`\`\`

</details>

*Pushed by: @${{ github.actor }}, Action: \`${{ github.event_name }}\`*`;

github.rest.issues.createComment({
  issue_number: context.issue.number,
  owner: context.repo.owner,
  repo: context.repo.repo,
  body: output
})