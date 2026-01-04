import 'package:flutter/material.dart';
import 'package:bricolage_ui/bricolage_ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bricolage UI Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: UIColors.primary),
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Bricolage UI Demo',
        actions: [
          CustomBadge(
            text: 'New',
            variant: CustomBadgeVariant.success,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(UISpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Buttons
            Text('Buttons', style: UITypography.heading2),
            SizedBox(height: UISpacing.md),
            Wrap(
              spacing: UISpacing.md,
              runSpacing: UISpacing.md,
              children: [
                CustomButton(
                  text: 'Primary',
                  variant: CustomButtonVariant.filled,
                  onPressed: () {},
                ),
                CustomButton(
                  text: 'Outlined',
                  variant: CustomButtonVariant.outlined,
                  onPressed: () {},
                ),
                CustomButton(
                  text: 'Text',
                  variant: CustomButtonVariant.text,
                  onPressed: () {},
                ),
              ],
            ),

            SizedBox(height: UISpacing.xl),

            // Cards
            Text('Cards', style: UITypography.heading2),
            SizedBox(height: UISpacing.md),
            CustomCard(
              variant: CustomCardVariant.elevated,
              child: Padding(
                padding: EdgeInsets.all(UISpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Card Title', style: UITypography.heading3),
                    SizedBox(height: UISpacing.sm),
                    Text('This is a card with elevated variant.'),
                  ],
                ),
              ),
            ),

            SizedBox(height: UISpacing.xl),

            // Form Fields
            Text('Form Fields', style: UITypography.heading2),
            SizedBox(height: UISpacing.md),
            CustomTextField(
              label: 'Email',
              placeholder: 'Enter your email',
            ),
            SizedBox(height: UISpacing.md),
            CustomTextarea(
              label: 'Message',
              placeholder: 'Enter your message',
              maxLines: 4,
            ),

            SizedBox(height: UISpacing.xl),

            // Badges & Chips
            Text('Badges & Chips', style: UITypography.heading2),
            SizedBox(height: UISpacing.md),
            Wrap(
              spacing: UISpacing.md,
              runSpacing: UISpacing.md,
              children: [
                CustomBadge(
                    text: 'Default', variant: CustomBadgeVariant.default_),
                CustomBadge(
                    text: 'Success', variant: CustomBadgeVariant.success),
                CustomBadge(
                    text: 'Destructive',
                    variant: CustomBadgeVariant.destructive),
                CustomChip(label: 'Flutter', icon: Icons.code),
                CustomChip(label: 'UI', icon: Icons.palette),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
