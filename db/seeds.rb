User.destroy_all
User.create([
    { fname:"XiXi", lname:"Luo", email:"xixiluo@gmail.com", username:"xl003", password:"luo123" },
    { fname:"Tom", lname:"Beach", email:"tombeach@gmail.com", username:"tb234", password:"beach" },
    { fname:"Smik", lname:"Lakhani", email:"smiklakhani@gmail.com", username:"sl123", password:"lakhani" },
    { fname:"Jason", lname:"Pursell", email:"jasonpursell@gmail.com", username:"js123", password:"pursell" }
])

Post.destroy_all
Post.create([
  { user_id:1, title:"XiXi First Post", content:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc."},
  { user_id:2, title:"Tom First Post", content:"Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh."},
  { user_id:3, title:"Smik First Post", content:"Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh. Quisque volutpat condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam nec ante. Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, a cursus ipsum ante quis turpis. Nulla facilisi. Ut fringilla. Suspendisse potenti. Nunc feugiat mi a tellus consequat imperdiet. Vestibulum sapien. Proin quam. Etiam ultrices. "},
  { user_id:4, title:"Jason First Post", content:"Suspendisse in justo eu magna luctus suscipit. Sed lectus. Integer euismod lacus luctus magna. Quisque cursus, metus vitae pharetra auctor, sem massa mattis sem, at interdum magna augue eget diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi lacinia molestie dui. Praesent blandit dolor. Sed non quam. In vel mi sit amet augue congue elementum. Morbi in ipsum sit amet pede facilisis laoreet. Donec lacus nunc, viverra nec, blandit vel, egestas et, augue. Vestibulum tincidunt malesuada tellus. Ut ultrices ultrices enim. Curabitur sit amet mauris."}
])

Comment.destroy_all
Comment.create([
  { user_id:2, post_id:1, content:"Great Post!"},
  { user_id:4, post_id:1, content:"Not my fav!"},
  { user_id:2, post_id:2, content:"I like my own post!"},
  { user_id:3, post_id:2, content:"Can do better!"},
  { user_id:4, post_id:3, content:"Great Post!"},
  { user_id:2, post_id:3, content:"I LOVE THIS POST!"},
  { user_id:2, post_id:4, content:"Great Post!"},
  { user_id:2, post_id:4, content:"I have comments!"}
])
