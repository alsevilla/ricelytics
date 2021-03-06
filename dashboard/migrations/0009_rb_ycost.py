# Generated by Django 3.2.5 on 2021-07-19 02:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0008_alter_kpi_pop_population'),
    ]

    operations = [
        migrations.CreateModel(
            name='rb_ycost',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('locCode', models.SmallIntegerField()),
                ('locType', models.CharField(blank=True, max_length=1, null=True)),
                ('year', models.CharField(blank=True, max_length=4, null=True)),
                ('yieldEst', models.DecimalField(blank=True, decimal_places=2, max_digits=12, null=True)),
                ('costperkg', models.DecimalField(blank=True, decimal_places=2, max_digits=12, null=True)),
            ],
            options={
                'db_table': 'rb_ycost',
            },
        ),
    ]
