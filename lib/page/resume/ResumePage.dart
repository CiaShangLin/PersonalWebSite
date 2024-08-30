import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../api/ResumeApi.dart';
import '../../data/Resume.dart';
import 'ResumeViewModell.dart';
import '../../ui/LoadingWidget.dart';
import '../../utils/ColorUtil.dart';
import 'LinkIconWidget.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ResumePageState();
  }
}

class _ResumePageState extends State<ResumePage> {

  late ResumeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ResumeViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Resume>(
      future: _viewModel.getResume(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Icon(Icons.error);
        } else {
          return getSuccess(snapshot.data);
        }
      },
    );
  }

  Widget getSuccess(Resume? resume) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(48, 48, 48, 0), // 如果需要可以調整 padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 確保從頂部開始排列
          crossAxisAlignment: CrossAxisAlignment.start, // 確保子項在交叉軸上從左邊開始排列
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 左邊標題藍
                getLeftContent(resume),
                SizedBox(width: 32),
                // 右邊內容
                getRightContent(resume),
              ],
            ),
            SizedBox(height: 32),
            Text(
              "技能",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor),
            ),
            getSkills(resume?.skills ?? []),
            SizedBox(height: 32),
            Text(
              "工作經歷",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 4),
            getWorkExperiences(resume?.workExperiences ?? []),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget getLeftContent(Resume? resume) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                resume?.img ?? "",
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(resume?.name ?? "",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500)),
          Text(
            resume?.jobTitle ?? "",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(
                Icons.map,
                size: 16,
              ),
              Text(
                "Taichung City, Taiwan",
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getRightContent(Resume? resume) {
    return Expanded(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(resume?.jobTitle ?? "",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black)),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 96, 0),
            child: Text(
              resume?.selfIntroduction ?? "",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 18),
            ),
          ),
          SizedBox(height: 8),
          getLinks(resume),
          //title
          //content
          //link row
        ],
      )),
    );
  }

  Widget getLinks(Resume? resume) {
    return Container(
      child: Row(
        children: resume?.socials
                ?.map((social) => LinkIconWidget(social: social))
                .toList() ??
            [],
      ),
    );
  }

  Widget getSkills(List<Skills> skills) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: skills.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 32, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  skills[index].title ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 24),
                ),
                const Divider(
                  color: resume_divider_color,
                  thickness: 1.5,
                ),
                ...skills[index].items?.map((item) => Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Row(
                            children: [
                              Container(
                                width: 8.0,
                                height: 8.0,
                                decoration: const BoxDecoration(
                                  color: skill_dot_color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                item,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: skill_text_color, fontSize: 16),
                              ),
                            ],
                          ),
                        )) ??
                    [],
              ],
            ),
          );
        });
  }

  Widget getWorkExperiences(List<WorkExperiences> workExperiences) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: workExperiences.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${workExperiences[index].position} • ${workExperiences[index].company} • ${workExperiences[index].startDate}~${workExperiences[index].endDate}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 24),
              ),
              Text("${workExperiences[index].description}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16)),
            ],
          );
        });
  }
}
