module origen_120381 (
    input wire i_CLK,
    input wire i_RST,
    input wire i_SET,
    input wire i_HR_INCR,
    input wire i_MN_INCR,
    output reg [3:0] o_HR_U,
    output reg [1:0] o_HR_T,
    output reg [3:0] o_MN_U,
    output reg [2:0] o_MN_T,
    output reg o_SEC,
    output reg o_VALID
);

    // Parameters
    parameter C_USEC_CNT_LIM = 999;

    // Internal registers
    reg [9:0] cnt_usec, usec;
    reg [5:0] sec;
    reg [3:0] mn_u;
    reg [2:0] mn_t;
    reg [3:0] hr_u;
    reg [1:0] hr_t;

    // Edge detection registers
    reg hr_incr_prev, mn_incr_prev;

    // Counter logic
    always @(posedge i_CLK or posedge i_RST) begin
        if (i_RST) begin
            cnt_usec <= 0;
            usec <= 0;
            sec <= 0;
            mn_u <= 0;
            mn_t <= 0;
            hr_u <= 0;
            hr_t <= 0;
            o_SEC <= 0;
            o_VALID <= 0;
        end else begin
            // Microsecond counter
            if (cnt_usec == C_USEC_CNT_LIM) begin
                cnt_usec <= 0;
                o_VALID <= 1;
                usec <= usec + 1;
                if (usec == 999) begin
                    usec <= 0;
                    sec <= sec + 1;
                    o_SEC <= 1;
                    if (sec == 59) begin
                        sec <= 0;
                        mn_u <= mn_u + 1;
                        if (mn_u == 9) begin
                            mn_u <= 0;
                            mn_t <= mn_t + 1;
                            if (mn_t == 5) begin
                                mn_t <= 0;
                                hr_u <= hr_u + 1;
                                if (hr_u == 9 || (hr_t == 2 && hr_u == 3)) begin
                                    hr_u <= 0;
                                    hr_t <= (hr_t == 2) ? 0 : hr_t + 1;
                                end
                            end
                        end
                    end
                end
            end else begin
                cnt_usec <= cnt_usec + 1;
                o_VALID <= 0;
                o_SEC <= 0;
            end
        end
    end

    // Time setting logic
    always @(posedge i_CLK or posedge i_RST) begin
        if (i_RST) begin
            hr_incr_prev <= 0;
            mn_incr_prev <= 0;
        end else if (i_SET) begin
            // Hour increment
            if (i_HR_INCR && !hr_incr_prev) begin
                hr_u <= hr_u + 1;
                if (hr_u == 9 || (hr_t == 2 && hr_u == 3)) begin
                    hr_u <= 0;
                    hr_t <= (hr_t == 2) ? 0 : hr_t + 1;
                end
            end
            hr_incr_prev <= i_HR_INCR;

            // Minute increment
            if (i_MN_INCR && !mn_incr_prev) begin
                mn_u <= mn_u + 1;
                if (mn_u == 9) begin
                    mn_u <= 0;
                    mn_t <= mn_t + 1;
                    if (mn_t == 5) begin
                        mn_t <= 0;
                    end
                end
            end
            mn_incr_prev <= i_MN_INCR;
        end
    end

    // Output assignment
    always @(*) begin
        o_HR_U = hr_u;
        o_HR_T = hr_t;
        o_MN_U = mn_u;
        o_MN_T = mn_t;
    end

endmodule