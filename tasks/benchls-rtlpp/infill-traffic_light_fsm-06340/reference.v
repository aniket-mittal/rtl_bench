module rtlpp_06340(
    input   F,
    input   B,
    input   ok,
    output reg [1:0] TL,
    input   clk,
    input   rst
    );
    
    // Parameter definitions for state encoding
    parameter off = 2'b00, car_waiting = 2'b01, go = 2'b10, crossing = 2'b11;
    
    // Internal state registers
    reg [1:0] state, nextState;
    
    // State transition on clock or reset
    always @(posedge clk or posedge rst) begin
        if (rst == 1)
            state <= off;
        else 
            state <= nextState;
    end
    
    // Next state logic based on current state and inputs
    always @(state or F or B or ok) begin
        case (state)
            off: begin
                if (F == 1) begin
                    TL <= 2'b10;
                    nextState <= car_waiting;                    
                end else begin
                    nextState <= off;
                    TL <= 2'b00;
                end
            end
            
            car_waiting: begin
                if (ok == 1) begin
                    nextState <= go;
                    TL <= 2'b01;
                end else begin
                    nextState <= car_waiting;
                    TL <= 2'b10;
                end
            end            
            
            go: begin
                if (B == 0) begin
                    nextState <= crossing;
                    TL <= 2'b10;
                end else begin
                    nextState <= go;
                    TL <= 2'b01;
                end
            end   
            
            crossing: begin
                if (B == 1 && F == 1) begin
                    nextState <= car_waiting;
                    TL <= 2'b10;
                end else if (B == 1 && F == 0) begin
                    nextState <= off;
                    TL <= 2'b00;
                end else begin
                    nextState <= crossing;
                    TL <= 2'b10;
                end
            end   
        endcase
    end
endmodule