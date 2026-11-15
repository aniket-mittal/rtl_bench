// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_020349 dut (
    .clk(clk),
    .write_ptr(in_vec[7:3]),
    .reset_n(in_vec[2:2]),
    .flush(in_vec[1:1]),
    .read_req(in_vec[0:0]),
    .read_enable(out_vec[8:8]),
    .rdata_valid(out_vec[7:7]),
    .fifo_empty(out_vec[6:6]),
    .fifo_aempty(out_vec[5:5]),
    .read_ptr(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h89;
    stim[1] = 8'h40;
    stim[2] = 8'h07;
    stim[3] = 8'hcc;
    stim[4] = 8'had;
    stim[5] = 8'hd4;
    stim[6] = 8'h4d;
    stim[7] = 8'hef;
    stim[8] = 8'ha5;
    stim[9] = 8'hf7;
    stim[10] = 8'hfa;
    stim[11] = 8'hf6;
    stim[12] = 8'h96;
    stim[13] = 8'hdc;
    stim[14] = 8'h4e;
    stim[15] = 8'h44;
    stim[16] = 8'h75;
    stim[17] = 8'h65;
    stim[18] = 8'had;
    stim[19] = 8'h6c;
    stim[20] = 8'hbd;
    stim[21] = 8'h04;
    stim[22] = 8'h0e;
    stim[23] = 8'h3e;
    stim[24] = 8'had;
    stim[25] = 8'h2c;
    stim[26] = 8'hf5;
    stim[27] = 8'hd6;
    stim[28] = 8'he7;
    stim[29] = 8'h15;
    stim[30] = 8'h87;
    stim[31] = 8'h5c;
    stim[32] = 8'h6e;
    stim[33] = 8'h0c;
    stim[34] = 8'h7f;
    stim[35] = 8'h2c;
    stim[36] = 8'h2e;
    stim[37] = 8'h87;
    stim[38] = 8'h8c;
    stim[39] = 8'hd7;
    stim[40] = 8'h05;
    stim[41] = 8'h3c;
    stim[42] = 8'hd4;
    stim[43] = 8'h67;
    stim[44] = 8'h2f;
    stim[45] = 8'h14;
    stim[46] = 8'h74;
    stim[47] = 8'h8c;
    stim[48] = 8'h77;
    stim[49] = 8'hd7;
    stim[50] = 8'h2e;
    stim[51] = 8'h76;
    stim[52] = 8'h4c;
    stim[53] = 8'hfc;
    stim[54] = 8'hd6;
    stim[55] = 8'h16;
    stim[56] = 8'h0c;
    stim[57] = 8'h77;
    stim[58] = 8'h3f;
    stim[59] = 8'hfe;
    stim[60] = 8'h97;
    stim[61] = 8'hb7;
    stim[62] = 8'he6;
    stim[63] = 8'hed;
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
      expv[0] = 9'h120;
      expv[1] = 9'h020;
      expv[2] = 9'h060;
      expv[3] = 9'h020;
      expv[4] = 9'h120;
      expv[5] = 9'h0a1;
      expv[6] = 9'h121;
      expv[7] = 9'h1a2;
      expv[8] = 9'h120;
      expv[9] = 9'h1a1;
      expv[10] = 9'h020;
      expv[11] = 9'h020;
      expv[12] = 9'h020;
      expv[13] = 9'h020;
      expv[14] = 9'h020;
      expv[15] = 9'h020;
      expv[16] = 9'h120;
      expv[17] = 9'h1a1;
      expv[18] = 9'h1a2;
      expv[19] = 9'h0a3;
      expv[20] = 9'h123;
      expv[21] = 9'h084;
      expv[22] = 9'h004;
      expv[23] = 9'h020;
      expv[24] = 9'h120;
      expv[25] = 9'h0a1;
      expv[26] = 9'h121;
      expv[27] = 9'h0a2;
      expv[28] = 9'h120;
      expv[29] = 9'h120;
      expv[30] = 9'h181;
      expv[31] = 9'h020;
      expv[32] = 9'h020;
      expv[33] = 9'h020;
      expv[34] = 9'h120;
      expv[35] = 9'h020;
      expv[36] = 9'h020;
      expv[37] = 9'h120;
      expv[38] = 9'h020;
      expv[39] = 9'h120;
      expv[40] = 9'h060;
      expv[41] = 9'h020;
      expv[42] = 9'h020;
      expv[43] = 9'h120;
      expv[44] = 9'h120;
      expv[45] = 9'h020;
      expv[46] = 9'h020;
      expv[47] = 9'h020;
      expv[48] = 9'h120;
      expv[49] = 9'h120;
      expv[50] = 9'h020;
      expv[51] = 9'h020;
      expv[52] = 9'h020;
      expv[53] = 9'h020;
      expv[54] = 9'h020;
      expv[55] = 9'h020;
      expv[56] = 9'h020;
      expv[57] = 9'h120;
      expv[58] = 9'h120;
      expv[59] = 9'h020;
      expv[60] = 9'h120;
      expv[61] = 9'h120;
      expv[62] = 9'h020;
      expv[63] = 9'h120;
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
