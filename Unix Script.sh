!#/bin/bash

#Creating the External and Internal tables using the "if" statement
if [[ "$EXT_TBL_RESULT" -eq "0" ]]; then
	echo "Hive External Table was created Successfully."
	hive -f "/home/cloudera/Downloads/StTwoA.hql"
	EXT_TBL_RESULT=$?

else
	echo "Hive External Table Query Failed."
	echo "Script StTwoA.hql completed with failure."
	exit 1

fi

if [[ "$INT_TBL_RESULT" -eq "0" ]]; then
	echo "Hive Internal Table was created Successfully."
	hive -f "/home/cloudera/Downloads/StTwoB.hql"
	INT_TBL_RESULT=$?

else
	echo "Hive Internal Table Query Failed."
	echo "Script StTwoB.hql completed with failure."
	exit 1

fi

#Creating an external table with static partitioning 
if [[ "$PEXT_TBL_RESULT" -eq "0" ]]; then
	echo "Hive Static Partitioned External Table was created Successfully."
	hive -f "/home/cloudera/Downloads/StThreeA.hql"
	PEXT_TBL_RESULT=$?

else
	echo "Hive Static Partitioned External Table Query Failed."
	echo "Script StThreeA.hql completed with failure."
	exit 1

fi

#Creating an internal table with static partitioning
if [[ "$PINT_TBL_RESULT" -eq "0" ]]; then
	echo "Hive Static Partitioned Internal Table was created Successfully."
	hive -f "/home/cloudera/Downloads/StThreeB.hql"
	PINT_TBL_RESULT=$?

else
	echo "Hive Static Partitioned Internal Table Query Failed."
	echo "Script StThreeB.hql completed with failure."
	exit 1

fi

#Creating an external table with dynamic partitioning
if [[ "$DEXT_TBL_RESULT" -eq "0" ]]; then
	echo "Hive Dynamic Partitioned External Table was created Successfully."
	hive -f "/home/cloudera/Downloads/StFourA.hql"
	DEXT_TBL_RESULT=$?

else
	echo "Hive Static Partitioned External Table Query Failed."
	echo "Script StFourA.hql completed with failure."
	exit 1

fi

#Creating an internal table with dynamic partitioning
if [[ "$DINT_TBL_RESULT" -eq "0" ]]; then
	echo "Hive Dynamic Partitioned Internal Table was created Successfully."
	hive -f "/home/cloudera/Downloads/StFourB.hql"
	DINT_TBL_RESULT=$?

else
	echo "Hive Dynamic Partitioned Internal Table Query Failed."
	echo "Script StFourB.hql completed with failure."
	exit 1

fi