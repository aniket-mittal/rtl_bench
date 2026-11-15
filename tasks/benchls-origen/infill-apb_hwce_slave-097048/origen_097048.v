module origen_097048 #(
    parameter APB_HWCE_ADDR_WIDTH = 32
) (
    input  wire                           clk_i,
    input  wire                           rst_ni,
    output reg  [31:0]                    apb_hwce_prdata_o,
    output wire                           apb_hwce_ready_o,
    output wire                           apb_hwce_pslverr_o,
    input  wire [APB_HWCE_ADDR_WIDTH-1:0] apb_hwce_addr_i,
    input  wire                           apb_hwce_enable_i,
    input  wire                           apb_hwce_psel_i,
    input  wire [31:0]                    apb_hwce_pwdata_i,
    input  wire                           apb_hwce_pwrite_i
);

    wire s_is_apb_write;
    wire s_is_apb_read;
    reg [1:0] do_display;

    assign s_is_apb_write = apb_hwce_psel_i && apb_hwce_enable_i && apb_hwce_pwrite_i;
    assign s_is_apb_read  = apb_hwce_psel_i && apb_hwce_enable_i && !apb_hwce_pwrite_i;

    assign apb_hwce_ready_o = 1'b1;
    assign apb_hwce_pslverr_o = 1'b0;

    [MASKED]

    always @(posedge clk_i) begin
        if (do_display == 2'b01) begin
            ;
        end else if (do_display == 2'b10) begin
            ;
        end
    end

    always @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            apb_hwce_prdata_o <= 32'h0;
        end else if (s_is_apb_read) begin
            apb_hwce_prdata_o <= 32'h00DA41DE;
        end
    end

endmodule