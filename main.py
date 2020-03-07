import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--issue_number", required=True)
parser.add_argument("--issue_comment_body", required=True)
parser.add_argument("--issue_user", required=True)
args = parser.parse_args()

reply_message = f"Hey @{args.issue_user}\n\nThis was you comment: {args.issue_comment_body}"

print(f"::set-output name=issue_comment_reply::'{reply_message}'")
