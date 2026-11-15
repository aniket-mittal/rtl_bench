module rtlpp_02545 (
    input clk,
    input clk__enable,

    input [31:0] apb_response__prdata,
    input apb_response__pready,
    input apb_response__perr,
    input [31:0] apb_request_1__paddr,
    input apb_request_1__penable,
    input apb_request_1__psel,
    input apb_request_1__pwrite,
    input [31:0] apb_request_1__pwdata,
    input [31:0] apb_request_0__paddr,
    input apb_request_0__penable,
    input apb_request_0__psel,
    input apb_request_0__pwrite,
    input [31:0] apb_request_0__pwdata,
    input reset_n,

    output reg [31:0] apb_request__paddr,
    output reg apb_request__penable,
    output reg apb_request__psel,
    output reg apb_request__pwrite,
    output reg [31:0] apb_request__pwdata,
    output reg [31:0] apb_response_1__prdata,
    output reg apb_response_1__pready,
    output reg apb_response_1__perr,
    output reg [31:0] apb_response_0__prdata,
    output reg apb_response_0__pready,
    output reg apb_response_0__perr
);

    reg arbiter_state__busy;
    reg arbiter_state__handling;
    reg [31:0] apb_request_1_r__paddr;
    reg apb_request_1_r__penable;
    reg apb_request_1_r__psel;
    reg apb_request_1_r__pwrite;
    reg [31:0] apb_request_1_r__pwdata;
    reg [31:0] apb_request_0_r__paddr;
    reg apb_request_0_r__penable;
    reg apb_request_0_r__psel;
    reg apb_request_0_r__pwrite;
    reg [31:0] apb_request_0_r__pwdata;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            apb_request_0_r__paddr <= 32'h0;
            apb_request_0_r__penable <= 1'h0;
            apb_request_0_r__psel <= 1'h0;
            apb_request_0_r__pwrite <= 1'h0;
            apb_request_0_r__pwdata <= 32'h0;
            apb_request_1_r__paddr <= 32'h0;
            apb_request_1_r__penable <= 1'h0;
            apb_request_1_r__psel <= 1'h0;
            apb_request_1_r__pwrite <= 1'h0;
            apb_request_1_r__pwdata <= 32'h0;
            apb_response_0__pready <= 1'h0;
            apb_response_1__pready <= 1'h0;
            apb_response_1__prdata <= 32'h0;
            apb_response_1__perr <= 1'h0;
            apb_response_0__prdata <= 32'h0;
            apb_response_0__perr <= 1'h0;
            arbiter_state__busy <= 1'h0;
            apb_request__psel <= 1'h0;
            apb_request__penable <= 1'h0;
            arbiter_state__handling <= 1'h0;
            apb_request__paddr <= 32'h0;
            apb_request__pwrite <= 1'h0;
            apb_request__pwdata <= 32'h0;
        end else if (clk__enable) begin
            if (apb_request_0__psel || apb_request_0_r__psel) begin
                apb_request_0_r__paddr <= apb_request_0__paddr;
                apb_request_0_r__penable <= apb_request_0__penable;
                apb_request_0_r__psel <= apb_request_0__psel;
                apb_request_0_r__pwrite <= apb_request_0__pwrite;
                apb_request_0_r__pwdata <= apb_request_0__pwdata;
                if (apb_response_0__pready) begin
                    apb_request_0_r__psel <= 1'h0;
                end
            end
            if (apb_request_1__psel || apb_request_1_r__psel) begin
                apb_request_1_r__paddr <= apb_request_1__paddr;
                apb_request_1_r__penable <= apb_request_1__penable;
                apb_request_1_r__psel <= apb_request_1__psel;
                apb_request_1_r__pwrite <= apb_request_1__pwrite;
                apb_request_1_r__pwdata <= apb_request_1__pwdata;
                if (apb_response_1__pready) begin
                    apb_request_1_r__psel <= 1'h0;
                end
            end
            apb_response_0__pready <= 1'h0;
            apb_response_1__pready <= 1'h0;
            if ((arbiter_state__busy && apb_request__penable) && apb_response__pready) begin
                if (arbiter_state__handling) begin
                    apb_response_1__prdata <= apb_response__prdata;
                    apb_response_1__pready <= apb_response__pready;
                    apb_response_1__perr <= apb_response__perr;
                end else begin
                    apb_response_0__prdata <= apb_response__prdata;
                    apb_response_0__pready <= apb_response__pready;
                    apb_response_0__perr <= apb_response__perr;
                end
            end
            if (arbiter_state__busy) begin
                if (apb_request__penable) begin
                    if (apb_response__pready) begin
                        arbiter_state__busy <= 1'h0;
                        apb_request__psel <= 1'h0;
                        apb_request__penable <= 1'h0;
                    end
                end else begin
                    apb_request__penable <= 1'h1;
                end
            end else begin
                if ((apb_request_0_r__psel && !apb_response_0__pready) && (!(apb_request_1_r__psel) || arbiter_state__handling)) begin
                    arbiter_state__busy <= 1'h1;
                    arbiter_state__handling <= 1'h0;
                    apb_request__paddr <= apb_request_0_r__paddr;
                    apb_request__penable <= apb_request_0_r__penable;
                    apb_request__psel <= apb_request_0_r__psel;
                    apb_request__pwrite <= apb_request_0_r__pwrite;
                    apb_request__pwdata <= apb_request_0_r__pwdata;
                    apb_request__penable <= 1'h0;
                end else if (apb_request_1_r__psel && !apb_response_1__pready) begin
                    arbiter_state__busy <= 1'h1;
                    arbiter_state__handling <= 1'h1;
                    apb_request__paddr <= apb_request_1_r__paddr;
                    apb_request__penable <= apb_request_1_r__penable;
                    apb_request__psel <= apb_request_1_r__psel;
                    apb_request__pwrite <= apb_request_1_r__pwrite;
                    apb_request__pwdata <= apb_request_1_r__pwdata;
                    apb_request__penable <= 1'h0;
                end
            end
        end
    end

endmodule