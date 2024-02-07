#!/bin/sh

HOME_DIR="/Users/nathanielhendrix/OneDrive - American Board of Family Medicine/Current projects/Gender Industry Pay Gap/"
REPO_PATH="${HOME_DIR}/industry_payment_gap/industry_payment_gap"

RAW_DATA_PATH="${HOME_DIR}/data"
CARECOMPARE_DATA_PATH="${RAW_DATA_PATH}/CareCompare"
NPPES_DATA_PATH="${RAW_DATA_PATH}/NPPES"
OPENPAYMENTS_DATA_PATH="${RAW_DATA_PATH}/OpenPayments"
COHORT_PATH="${HOME_DIR}/data/final_dataset"

cohort_summary_file="${COHORT_PATH}/industry_payments_analytic.csv"
cohort_summary_file_w_research="${COHORT_PATH}/industry_payments_analytic_w_research.csv"
cohort_ts_file="${COHORT_PATH}/industry_payments_ts.csv"

# Run the appropriate R script with arguments
Rscript "${REPO_PATH}/industry_payment_gap/preproc/trim_payments.R" "$OPENPAYMENTS_DATA_PATH" "$NPPES_DATA_PATH" "$CARECOMPARE_DATA_PATH" "$cohort_summary_file"

# Parse command-line options
for arg in "$@"
do
    case $arg in
        --include_research)
        Rscript "${REPO_PATH}/industry_payment_gap/preproc/trim_research.R" "$OPENPAYMENTS_DATA_PATH" "$NPPES_DATA_PATH" "$cohort_summary_file" "$cohort_summary_file_w_research"
        shift # Remove --include_research from processing
        ;;
        *)
        # Unknown options can be handled here
        ;;
    esac
done

#python ${REPO_PATH}/preproc/cohort_definition_aggregate.py --input_dir $var_dir --output_dir $coh_dir --print_info 1

#python ${REPO_PATH}/preproc/aggregate_and_split.py --cohort_path $coh_dir --output_path $final_cohort_file