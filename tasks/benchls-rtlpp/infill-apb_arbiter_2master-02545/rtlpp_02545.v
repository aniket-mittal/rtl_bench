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

    [MASKED]

endmodule