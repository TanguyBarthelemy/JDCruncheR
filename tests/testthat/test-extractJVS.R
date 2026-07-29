test_that("extract_JVS returns a dataframe with the right structure", {
    test_dir <- testthat::test_path("data", "JVS")

    result <- extract_JVS(
        dir = test_dir,
        demetra_m = NULL,
        y = NULL,
        sa = NULL,
        s = NULL,
        t = NULL
    )

    # Dataframe:
    expect_s3_class(result, "JVS_matrix")

    # Number of columns:
    expect_identical(ncol(result), 30L)

    # Column names and types:
    expected_types <- c(
        Series = "character",
        Method = "character",
        Period = "integer",
        Nobs = "integer",
        Start = "character",
        End = "character",
        Adjustment = "character",
        `Presence of Seasonality in the Raw Series` = "character",
        `Presence of TD effects` = "character",
        `Log-Transformation` = "character",
        `ARIMA Model` = "character",
        LeapYear = "character",
        MovingHoliday = "character",
        NbTD = "integer",
        Noutliers = "integer",
        Outlier1 = "character",
        Outlier2 = "character",
        Outlier3 = "character",
        `Residual Seasonality in SA Series (F-test)` = "character",
        `Residual TD Effect` = "character",
        `Q-Stat (for X13)` = "character",
        `Final Henderson Filter` = "character",
        `Stage 2 Henderson Filter` = "character",
        `Seasonal Filter` = "character",
        `Irregular Standard-Deviation` = "numeric",
        `Quality (for TS)` = "character",
        `Max-Adj` = "numeric",
        `Autocorrelation of order 1 of the SA series` = "numeric",
        `Normal Test (P-value)` = "numeric",
        `Autocorrelation negative and significant` = "character"
    )

    expect_named(result, names(expected_types))

    actual_types <- vapply(X = result, FUN = class, FUN.VALUE = character(1L))

    expect_identical(actual_types, expected_types)
})
