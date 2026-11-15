module rtlpp_03842(
    input wire clk,
    input wire [1:0] ct, 
    input wire rst,
    input wire [15:0] a,
    output reg [7:0] dout,
    input wire [7:0] din,
    input wire rd,
    input wire wr,
    output reg int_tim_req,
    input wire int_tim_ack
    );
    
    reg [7:0] reg_div; 
    reg [7:0] reg_tima; 
    reg [7:0] reg_tma; 
    reg [7:0] reg_tac; 
    
    wire addr_in_timer = ((a == 16'hFF04) ||
                          (a == 16'hFF05) ||
                          (a == 16'hFF06) ||
                          (a == 16'hFF07)) ? 1'b1 : 1'b0;
    
    reg [15:0] div;
    
    wire reg_timer_enable = reg_tac[2];
    wire [1:0] reg_clock_sel = reg_tac[1:0];
    
    assign reg_div[7:0] = div[15:8];
    wire clk_4khz = div[9];
    wire clk_256khz = div[3];
    wire clk_64khz = div[5];
    wire clk_16khz = div[7];
    wire clk_tim;
    assign clk_tim = (reg_timer_enable) ? (
        (reg_clock_sel == 2'b00) ? (clk_4khz) : (
        (reg_clock_sel == 2'b01) ? (clk_256khz) : (
        (reg_clock_sel == 2'b10) ? (clk_64khz) : 
                                   (clk_16khz)))) : (1'b0);
    
    reg last_clk_tim;
    reg write_block;
    
    always @(*) begin
        dout = 8'hFF;
        if (a == 16'hFF04) 
            dout = reg_div; 
        else if (a == 16'hFF05) 
            dout = reg_tima; 
        else if (a == 16'hFF06) 
            dout = reg_tma; 
        else if (a == 16'hFF07) 
            dout = reg_tac;
    end
    
    always @(posedge clk) begin
        last_clk_tim <= clk_tim;
    end
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            reg_tima <= 0;
            reg_tma <= 0;
            reg_tac <= 0;
            div <= 0;
            int_tim_req <= 0;
            write_block <= 0;
        end else begin
            div <= div + 1'b1;
            if ((wr) && (a == 16'hFF04))
                div <= 4; 
            else if ((wr) && (a == 16'hFF06)) begin
                reg_tma <= din;
                if (write_block)
                    reg_tima <= din;
            end else if ((wr) && (a == 16'hFF07)) 
                reg_tac <= din;
            else if ((wr) && (a == 16'hFF05) && (!write_block)) 
                reg_tima <= din;
            else begin
                if ((last_clk_tim == 1'b1) && (clk_tim == 1'b0)) begin
                    reg_tima <= reg_tima + 1'b1;
                    if (reg_tima == 8'hFF) 
                        int_tim_req <= 1'b1; 
                end else begin
                    if ((int_tim_req) && (int_tim_ack)) 
                        int_tim_req <= 1'b0;
                    
                    if ((ct == 2'b00) && (reg_timer_enable)) begin
                        if (reg_tima == 8'd0) begin
                            reg_tima <= reg_tma;
                            write_block <= 1'b1;
                        end else begin
                            write_block <= 1'b0;
                        end
                    end
                end
            end
        end
    end

endmodule