
// class AvatarImage extends CachedNetworkImage {
//   AvatarImage(String url, {isLoading = false})
//       : super(
//           imageUrl: url,
//           imageBuilder: (context, imageProvider) => isLoading
//               ? Center(child: LoadingIndicator(radius: 20))
//               : CircleAvatar(
//                   backgroundColor: Colors.white,
//                   backgroundImage: imageProvider),
//           placeholder: (context, url) =>
//               Center(child: LoadingIndicator(radius: 20)),
//           errorWidget: (context, url, error) => Icon(Icons.error),
//           width: double.infinity,
//           fit: BoxFit.cover,
//         );
// }
