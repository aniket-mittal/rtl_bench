module rtlpp_06951
(
    clk,
    clk__enable,

    apb_response__prdata,
    apb_response__pready,
    apb_response__perr,
    apb_request_1__paddr,
    apb_request_1__penable,
    apb_request_1__psel,
    apb_request_1__pwrite,
    apb_request_1__pwdata,
    apb_request_0__paddr,
    apb_request_0__penable,
    apb_request_0__psel,
    apb_request_0__pwrite,
    apb_request_0__pwdata,
    reset_n,

    apb_request__paddr,
    apb_request__penable,
    apb_request__psel,
    apb_request__pwrite,
    apb_request__pwdata,
    apb_response_1__prdata,
    apb_response_1__pready,
    apb_response_1__perr,
    apb_response_0__prdata,
    apb_response_0__pready,
    apb_response_0__perr
);

    input clk;
    input clk__enable;

    input [31:0]apb_response__prdata;
    input apb_response__pready;
    input apb_response__perr;
        
    input [31:0]apb_request_1__paddr;
    input apb_request_1__penable;
    input apb_request_1__psel;
    input apb_request_1__pwrite;
    input [31:0]apb_request_1__pwdata;
        
    input [31:0]apb_request_0__paddr;
    input apb_request_0__penable;
    input apb_request_0__psel;
    input apb_request_0__pwrite;
    input [31:0]apb_request_0__pwdata;
        
    input reset_n;

    output [31:0]apb_request__paddr;
    output apb_request__penable;
    output apb_request__psel;
    output apb_request__pwrite;
    output [31:0]apb_request__pwdata;
        
    output [31:0]apb_response_1__prdata;
    output apb_response_1__pready;
    output apb_response_1__perr;
        
    output [31:0]apb_response_0__prdata;
    output apb_response_0__pready;
    output apb_response_0__perr;

    reg arbiter_state__busy;
    reg arbiter_state__handling;
    reg [31:0]apb_request_1_r__paddr;
    reg apb_request_1_r__penable;
    reg apb_request_1_r__psel;
    reg apb_request_1_r__pwrite;
    reg [31:0]apb_request_1_r__pwdata;
    reg [31:0]apb_request_0_r__paddr;
    reg apb_request_0_r__penable;
    reg apb_request_0_r__psel;
    reg apb_request_0_r__pwrite;
    reg [31:0]apb_request_0_r__pwdata;
    reg [31:0]apb_request__paddr;
    reg apb_request__penable;
    reg apb_request__psel;
    reg apb_request__pwrite;
    reg [31:0]apb_request__pwdata;
    reg [31:0]apb_response_1__prdata;
    reg apb_response_1__pready;
    reg apb_response_1__perr;
    reg [31:0]apb_response_0__prdata;
    reg apb_response_0__pready;
    reg apb_response_0__perr;

    [MASKED]

endmodule