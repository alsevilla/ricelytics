# Generated by Django 3.2.5 on 2021-07-08 02:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0003_auto_20210708_0914'),
    ]

    operations = [
        migrations.AlterField(
            model_name='kpi_costs',
            name='locCode',
            field=models.SmallIntegerField(),
        ),
        migrations.AlterField(
            model_name='kpi_cpi',
            name='locCode',
            field=models.SmallIntegerField(),
        ),
        migrations.AlterField(
            model_name='kpi_pay',
            name='locCode',
            field=models.SmallIntegerField(),
        ),
        migrations.AlterField(
            model_name='kpi_prices',
            name='locCode',
            field=models.SmallIntegerField(),
        ),
        migrations.AlterField(
            model_name='kpi_sua',
            name='locCode',
            field=models.SmallIntegerField(),
        ),
        migrations.AlterField(
            model_name='kpi_value',
            name='locCode',
            field=models.SmallIntegerField(),
        ),
    ]
