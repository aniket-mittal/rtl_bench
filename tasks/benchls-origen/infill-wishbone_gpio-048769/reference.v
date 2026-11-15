module origen_048769
    #(
        parameter WB_ADR_WIDTH = 2,
        parameter WB_DAT_WIDTH = 32,
        parameter PORT_WIDTH = 32,
        parameter INIT_DIRECTION = {PORT_WIDTH{1'b1}},
        parameter INIT_OUTPUT = {PORT_WIDTH{1'b0}},
        parameter DIRECTION_MASK = {PORT_WIDTH{1'b1}}
    )
    (
        input  wire                       clk,
        input  wire                       rst,
        
        input  wire [PORT_WIDTH-1:0]      port_i,
        output wire [PORT_WIDTH-1:0]      port_o,
        output wire [PORT_WIDTH-1:0]      port_t,
        
        input  wire [WB_ADR_WIDTH-1:0]    s_wb_adr_i,
        input  wire [WB_DAT_WIDTH-1:0]    s_wb_dat_i,
        output wire [WB_DAT_WIDTH-1:0]    s_wb_dat_o,
        input  wire                       s_wb_we_i,
        input  wire [WB_DAT_WIDTH/8-1:0]  s_wb_sel_i,
        input  wire                       s_wb_stb_i,
        output wire                       s_wb_ack_o
    );
    
    localparam GPIO_ADR_DIRECTION = 2'b00;
    localparam GPIO_ADR_INPUT     = 2'b01;
    localparam GPIO_ADR_OUTPUT    = 2'b10;
    
    reg [PORT_WIDTH-1:0] reg_direction;
    reg [PORT_WIDTH-1:0] reg_output;
    
    always @(posedge clk) begin
        if (rst) begin
            reg_direction <= INIT_DIRECTION;
            reg_output    <= INIT_OUTPUT;
        end
        else if (s_wb_stb_i && s_wb_we_i) begin
            case (s_wb_adr_i)
                GPIO_ADR_DIRECTION: reg_direction <= (reg_direction & ~DIRECTION_MASK) | (s_wb_dat_i[PORT_WIDTH-1:0] & DIRECTION_MASK);
                GPIO_ADR_OUTPUT:    reg_output    <= s_wb_dat_i[PORT_WIDTH-1:0];
            endcase
        end
    end
    
    assign port_o = reg_output;
    assign port_t = ~reg_direction;
    
    assign s_wb_dat_o = (s_wb_adr_i == GPIO_ADR_INPUT) ? port_i :
                        (s_wb_adr_i == GPIO_ADR_DIRECTION) ? reg_direction :
                        reg_output;
    
    assign s_wb_ack_o = s_wb_stb_i;

endmodule