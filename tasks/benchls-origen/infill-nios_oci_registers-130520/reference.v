module origen_130520 (
    input wire [8:0] address,
    input wire clk,
    input wire debugaccess,
    input wire monitor_error,
    input wire monitor_go,
    input wire monitor_ready,
    input wire reset_n,
    input wire write,
    input wire [31:0] writedata,
    
    output reg [31:0] oci_ienable,
    output reg [31:0] oci_reg_readdata,
    output reg oci_single_step_mode,
    output wire ocireg_ers,
    output wire ocireg_mrs,
    output wire take_action_ocireg
);

    localparam OCI_REG_00 = 9'h100;
    localparam OCI_REG_01 = 9'h101;

    wire address_is_oci_reg_00 = (address == OCI_REG_00);
    wire address_is_oci_reg_01 = (address == OCI_REG_01);

    assign ocireg_ers = address_is_oci_reg_00 & write;
    assign ocireg_mrs = address_is_oci_reg_01 & write;
    assign take_action_ocireg = debugaccess & write & (address_is_oci_reg_00 | address_is_oci_reg_01);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            oci_single_step_mode <= 1'b0;
            oci_ienable <= 32'h0;
        end else begin
            if (take_action_ocireg) begin
                if (address_is_oci_reg_00) begin
                    oci_single_step_mode <= writedata[0];
                end else if (address_is_oci_reg_01) begin
                    oci_ienable <= writedata;
                end
            end
        end
    end

    always @(*) begin
        if (address_is_oci_reg_00) begin
            oci_reg_readdata = {28'b0, oci_single_step_mode, monitor_go, monitor_ready, monitor_error};
        end else if (address_is_oci_reg_01) begin
            oci_reg_readdata = oci_ienable;
        end else begin
            oci_reg_readdata = 32'h0;
        end
    end

endmodule