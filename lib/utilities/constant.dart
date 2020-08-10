
import 'package:flutter/material.dart';

final appBarContainer = Container(
  decoration: new BoxDecoration(
    gradient: new LinearGradient(
    colors: [
    const Color(0xFF00CCFF),
    const Color(0xFF3366FF),
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp
    ),
  ),
);
const menuStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);
const menuStyle2 = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue, fontStyle: FontStyle.italic);
const paraStyle = TextStyle(color: Colors.black87, fontSize: 18, letterSpacing: 0.10,);

const para1 = 'Like ICT-Tube হল একটি অনলাইন ভিত্তিক তথ্য ও যোগাযোগ প্রযুক্তি নির্ভর শিক্ষা সহায়ক অ্যাপ।';

const para2 = 'এই অ্যাপে একাদশ ও দ্বাদশ শেণির তথ্য ও যোগাযোগ প্রযুক্তি বিষয়ের ভিডিও টিউটোরিয়াল দেওয়া হয়েছে। এ টিউটোরিয়ালগুলো অধ্যায়ের গুরুত্বপূর্ণ টপিকসভিত্তিক করা হয়েছে। যা দেখে শিক্ষার্থীরা অনুশীলন করতে পারবে। এখানে আমি ভিডিও এর মাধ্যমে বিভিন্ন বিষয়ের প্রয়োজনীয় ব্যাখ্যা নির্ভুলভাবে প্রদান করার চেষ্টা করেছি। আশাকরি, এতে সকল শিক্ষার্থী উপকৃত হতে পারবে।';

const para3 = 'খুব শিঘ্রই এই অ্যাপে ফ্রিল্যান্সিং ভিডিও টিউটোরিয়াল সিরিজ যুক্ত করা হবে। ফ্রিল্যান্সিং টিউটোরিয়াল সিরিজে ওয়েভসাইট ডিজাইন এন্ড ডেভেলপমেন্ট এবং মোবাইল অ্যাপ ডেভেলপমেন্ট ক্লাস যুক্ত করা হবে। যাতে শিক্ষার্থীরা লেখাপড়ার পাশাপাশি আত্মনির্ভরশীল হতে পারে।';

const para4 = 'এই অ্যাপ এর ভিডিও টিউটোরিয়ালগুলো দেখার জন্য অবশ্যই ইন্টারনেট কানেকশান অন থাকতে হবে। কিছু দিন পর পর এই অ্যাপ এর আপডেট ভার্সন রিলিজ হবে। প্রতিটি আপডেট ভার্সনে নতুন টিউটোরিয়াল যুক্ত করা হবে। তাই যখনই নতুন আপডেট আসবে তখন অবশ্যই অ্যাপটি আপডেট করতে হবে।';

const para5 = 'এই অ্যাপটি কোন শিক্ষাপ্রতিষ্ঠান বা  শিক্ষকের বিকল্প নয়। আমাদের মূল উদ্দেশ্য আইসিটি ভীতিকে দূর করে চূড়ান্ত সফলতা অর্জন করা।';
