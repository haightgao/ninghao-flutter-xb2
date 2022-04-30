import 'package:flutter/material.dart';
import 'package:flutter_xb2/app/components/app_button.dart';
import 'package:flutter_xb2/app/components/app_text_field.dart';
import 'package:flutter_xb2/app/exceptions/app_exception.dart';
import 'package:flutter_xb2/app/exceptions/validate_exception.dart';
import 'package:flutter_xb2/post/create/components/post_create_media.dart';
import 'package:flutter_xb2/post/create/post_create_model.dart';
import 'package:provider/provider.dart';

class PostCreateForm extends StatefulWidget {
  const PostCreateForm({Key? key}) : super(key: key);

  @override
  State<PostCreateForm> createState() => _PostCreateFormState();
}

class _PostCreateFormState extends State<PostCreateForm> {
  final formKey = GlobalKey<FormState>();

  /// 是否自动验证
  bool canValidate = true;

  /// 文本编辑控制器
  final titleFiledController = TextEditingController();
  final contextFiledController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final title = context.read<PostCreateModel>().title;
    final content = context.read<PostCreateModel>().content;

    if (title != null) {
      titleFiledController.text = title;
    }
    if (content != null) {
      contextFiledController.text = content;
    }
  }

  @override
  Widget build(BuildContext context) {
    final postCreateModel = context.watch<PostCreateModel>();

    if (postCreateModel.selectedFile != null && postCreateModel.title == null) {
      final title = postCreateModel.selectedFile!.name.split('.')[0];
      titleFiledController.text = title;
      postCreateModel.setTitle(title);
    }

    /// 标题字段
    final titleFiled = AppTextField(
      labelText: '标题',
      controller: titleFiledController,
      enabled: !postCreateModel.loading,
      canValidate: canValidate,
      onChanged: (value) {
        postCreateModel.setTitle(value);
      },
    );

    /// 正文字段
    final contentFiled = AppTextField(
      labelText: '正文',
      controller: contextFiledController,
      isMultiline: true,
      enabled: !postCreateModel.loading,
      canValidate: canValidate,
      onChanged: (value) {
        postCreateModel.setContent(value);
      },
    );

    /// 验证表单
    validate() {
      final isValid = formKey.currentState!.validate();
      if (!isValid) {
        throw ValidateException();
      }
    }

    /// 重置表单
    reset() {
      setState(() {
        titleFiledController.text = '';
        contextFiledController.text = '';
        canValidate = false;
        postCreateModel.reset();
      });
    }

    /// 提交创建内容
    submitCreatePost() async {
      try {
        validate();
        postCreateModel.setLoading(true);
        final postId = await postCreateModel.createPost();
        await postCreateModel.createFile(postId: postId);
        print('$runtimeType : $postId');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('内容发布成功'),
          ),
        );
        reset();
      } on AppException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
          ),
        );
      } finally {
        postCreateModel.setLoading(false);
      }
    }

    /// 提交按钮
    final submitButton = AppButton(
      text: '发布',
      onPressed: postCreateModel.loading == true ? null : submitCreatePost,
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PostCreateMedia(),
          titleFiled,
          contentFiled,
          submitButton,
        ],
      ),
    );
  }
}
