// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 82;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_104002 dut (
    .clk(clk),
    .mem_read(in_vec[3:3]),
    .mem_write(in_vec[2:2]),
    .hit(in_vec[1:1]),
    .pmem_resp(in_vec[0:0]),
    .hit_out(out_vec[81:81]),
    .dirty1_out(out_vec[80:80]),
    .dirty2_out(out_vec[79:79]),
    .valid1_out(out_vec[78:78]),
    .valid2_out(out_vec[77:77]),
    .pmem_read(out_vec[76:76]),
    .pmem_write(out_vec[75:75]),
    .set_sel(out_vec[74:73]),
    .tag_sel(out_vec[72:71]),
    .dirty1_in(out_vec[70:70]),
    .dirty2_in(out_vec[69:69]),
    .valid1_in(out_vec[68:68]),
    .valid2_in(out_vec[67:67]),
    .lru_in(out_vec[66:66]),
    .lru_out(out_vec[65:65]),
    .hits(out_vec[64:33]),
    .miss(out_vec[32:1]),
    .pmem_address_sel(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h3;
    stim[1] = 4'hf;
    stim[2] = 4'h3;
    stim[3] = 4'h9;
    stim[4] = 4'hf;
    stim[5] = 4'hd;
    stim[6] = 4'h9;
    stim[7] = 4'hc;
    stim[8] = 4'h2;
    stim[9] = 4'hc;
    stim[10] = 4'hd;
    stim[11] = 4'hf;
    stim[12] = 4'h4;
    stim[13] = 4'h0;
    stim[14] = 4'h5;
    stim[15] = 4'h3;
    stim[16] = 4'hc;
    stim[17] = 4'h2;
    stim[18] = 4'h0;
    stim[19] = 4'h9;
    stim[20] = 4'hd;
    stim[21] = 4'h7;
    stim[22] = 4'h1;
    stim[23] = 4'hd;
    stim[24] = 4'h8;
    stim[25] = 4'h0;
    stim[26] = 4'hb;
    stim[27] = 4'h6;
    stim[28] = 4'h7;
    stim[29] = 4'h4;
    stim[30] = 4'h5;
    stim[31] = 4'ha;
    stim[32] = 4'h8;
    stim[33] = 4'hb;
    stim[34] = 4'ha;
    stim[35] = 4'h7;
    stim[36] = 4'h3;
    stim[37] = 4'ha;
    stim[38] = 4'h2;
    stim[39] = 4'hb;
    stim[40] = 4'hf;
    stim[41] = 4'he;
    stim[42] = 4'h8;
    stim[43] = 4'h0;
    stim[44] = 4'h2;
    stim[45] = 4'he;
    stim[46] = 4'h2;
    stim[47] = 4'h1;
    stim[48] = 4'hd;
    stim[49] = 4'ha;
    stim[50] = 4'hc;
    stim[51] = 4'h1;
    stim[52] = 4'ha;
    stim[53] = 4'hf;
    stim[54] = 4'hf;
    stim[55] = 4'hb;
    stim[56] = 4'h5;
    stim[57] = 4'hb;
    stim[58] = 4'h4;
    stim[59] = 4'h3;
    stim[60] = 4'h4;
    stim[61] = 4'h6;
    stim[62] = 4'ha;
    stim[63] = 4'hf;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[1] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[2] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[3] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[4] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[5] = 82'hxx1xxxxxxxxxxxxxxxxxx;
      expv[6] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[7] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[8] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[9] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[10] = 82'hxx1xxxxxxxxxxxxxxxxxx;
      expv[11] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[12] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[13] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[14] = 82'hxx1xxxxxxxxxxxxxxxxxx;
      expv[15] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[16] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[17] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[18] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[19] = 82'hxx1xxxxxxxxxxxxxxxxxx;
      expv[20] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[21] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[22] = 82'hxx1xxxxxxxxxxxxxxxxxx;
      expv[23] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[24] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[25] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[26] = 82'hxx1xxxxxxxxxxxxxxxxxx;
      expv[27] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[28] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[29] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[30] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[31] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[32] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[33] = 82'hxx1xxxxxxxxxxxxxxxxxx;
      expv[34] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[35] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[36] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[37] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[38] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[39] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[40] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[41] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[42] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[43] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[44] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[45] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[46] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[47] = 82'hxx1xxxxxxxxxxxxxxxxxx;
      expv[48] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[49] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[50] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[51] = 82'hxx1xxxxxxxxxxxxxxxxxx;
      expv[52] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[53] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[54] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[55] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[56] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[57] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[58] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[59] = 82'hxx1xxxxxxxxxxxxxxxxxx;
      expv[60] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[61] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[62] = 82'hxx0xxxxxxxxxxxxxxxxxx;
      expv[63] = 82'hxx1xxxxxxxxxxxxxxxxxx;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
