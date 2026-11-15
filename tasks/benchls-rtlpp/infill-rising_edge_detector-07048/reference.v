module rtlpp_07048(
    input wire clk,
    input wire signal,
    output reg outedge
    );

    reg [1:0] c_state ;
    reg [1:0] r_state ;

    // State encoding
    localparam ZERO = 2'd0;
    localparam CHANGE = 2'd1;
    localparam ONE = 2'd2;

    always @(*) begin
        case (r_state)
            ZERO : begin
                c_state =  signal == 1'b1 ? CHANGE :  ZERO ;
                outedge = 1'd0 ;
            end

            CHANGE : begin
                c_state = ONE;
                outedge = 1'd1;
            end

            ONE : begin
                c_state = signal == 1'b1 ? ONE : ZERO;
                outedge = 1'd0;
            end

            default : begin
                c_state = ZERO ;
                outedge = 1'd0 ;
            end
        endcase
    end

    always @( posedge clk ) begin
        r_state <= c_state ;
    end

endmodule