module rtlpp_02664 (
    input   wire                    clk,
    input   wire                    rst,        
    input   wire                    start,      
    input   wire                    last,       
    input   wire [2*ADDR_WIDTH-1:0] addr_tuple, 
    input   wire [2*WAY_WIDTH-1:0]  way_tuple,  

    output  reg                     next,       
    output  reg                     plc_error,  

    input   wire [DATA_SIZE-1:0]    ddata,      

    output  reg                     read_en,    
    output  reg [ADDR_WIDTH-1:0]    addr_out,   
    output  reg [WAY_WIDTH-1:0]     way_out    
);

    parameter ADDR_WIDTH = 8;
    parameter WAY_WIDTH = 4;
    parameter DATA_SIZE = 64;

    parameter FA = 4'd0;
    parameter SA = 4'd1;
    parameter DO = 4'd2;
    parameter DE = 4'd3;
    parameter LO = 4'd4;
    parameter LE = 4'd5;

    reg [DATA_SIZE-1:0] data_o;                 
    reg [3:0] state;
    integer k;

    always @(posedge clk or posedge rst) begin        
        if (rst) begin
            plc_error <= 1'b0;     
            read_en   <= 1'b0;
            state     <= 0;
            next      <= 1'b0;
        end else begin
            if(start & state == FA) begin
                addr_out <= addr_tuple[2*ADDR_WIDTH-1:ADDR_WIDTH];  
                way_out <= way_tuple[2*WAY_WIDTH-1:WAY_WIDTH];      
                state   <= SA;
                read_en <= 1'b1;
                next    <= 1'b0;
            end

            if (state == SA) begin
                addr_out <= addr_tuple[ADDR_WIDTH-1:0]; 
                way_out  <= way_tuple[WAY_WIDTH-1:0];   
                read_en  <= 1'b1;
                state <= DO;
                next  <= 1'b1;              
                if(last == 1'b1) begin      
                    state <= LO;
                end
            end

            if (state == DO) begin
                addr_out <= addr_tuple[2*ADDR_WIDTH-1:ADDR_WIDTH];
                way_out  <= way_tuple[2*WAY_WIDTH-1:WAY_WIDTH];
                read_en  <= 1'b1;
                state <= DE;
                next  <= 1'b0;
            end

            if (state == DE) begin
                if (data_o != ddata) begin
                    plc_error <= 1'b1;
                end
                addr_out <= addr_tuple[ADDR_WIDTH-1:0];
                way_out  <= way_tuple[WAY_WIDTH-1:0];
                read_en  <= 1'b1;
                state <= DO;
                next  <= 1'b1;
                if (last == 1'b1) begin
                    state <= LO;
                end
            end

            if(state == LO) begin
                data_o  <= ddata;       
                state   <= LE;
                read_en <= 1'b0;
            end

            if (state == LE) begin
                if (data_o != ddata) begin
                    plc_error <= 1'b1;
                end else begin
                    plc_error <= 1'b1;
                end
                read_en <= 1'b0;
                state <= FA;
            end 
        end 
    end

endmodule