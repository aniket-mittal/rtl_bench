// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_139984 dut (
    .clk(clk),
    .rst(in_vec[43:43]),
    .read_addr(in_vec[42:40]),
    .write_addr(in_vec[39:37]),
    .write_data(in_vec[36:33]),
    .input_signal(in_vec[32:1]),
    .select(in_vec[0:0]),
    .output_data(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'h81464903c7f;
    stim[1] = 44'h84ac22620ff;
    stim[2] = 44'h527ed6c01b5;
    stim[3] = 44'h6bb30468b0b;
    stim[4] = 44'h3c254fa9896;
    stim[5] = 44'h6b22139be59;
    stim[6] = 44'h0a83696d72b;
    stim[7] = 44'h5a3dbe11a10;
    stim[8] = 44'h3146ac10b2c;
    stim[9] = 44'h665ecc01bc9;
    stim[10] = 44'h7d995ae8e81;
    stim[11] = 44'h23b2df3b563;
    stim[12] = 44'h0f7fde69f2f;
    stim[13] = 44'h50cb48e469d;
    stim[14] = 44'h70b56a1be8e;
    stim[15] = 44'h231c3a1eaf8;
    stim[16] = 44'h0541ff8ecf8;
    stim[17] = 44'h25b8e9f9ad6;
    stim[18] = 44'h69a56ad1d9e;
    stim[19] = 44'h448f2360de0;
    stim[20] = 44'h75da8552de0;
    stim[21] = 44'h2c5cf13c4cf;
    stim[22] = 44'h8d2a635c929;
    stim[23] = 44'h6042fc40b0d;
    stim[24] = 44'h284f8d02172;
    stim[25] = 44'h611c2e627a3;
    stim[26] = 44'h290ce80d0c6;
    stim[27] = 44'h7dd51bb5985;
    stim[28] = 44'h3ba09553c89;
    stim[29] = 44'h2e35299ca40;
    stim[30] = 44'h690a956e322;
    stim[31] = 44'h6e209b05df2;
    stim[32] = 44'h1b113927877;
    stim[33] = 44'h469b8536fb0;
    stim[34] = 44'h22c1bd666ea;
    stim[35] = 44'h5175df867aa;
    stim[36] = 44'h59fc13609a7;
    stim[37] = 44'h20a92cb0fd2;
    stim[38] = 44'h093853cafeb;
    stim[39] = 44'h7870edd2472;
    stim[40] = 44'h03e79a3e6d3;
    stim[41] = 44'h3d1912665e7;
    stim[42] = 44'h3cc054b5615;
    stim[43] = 44'h67a94ae9f8f;
    stim[44] = 44'h5ab497826c0;
    stim[45] = 44'h73fbf25feb7;
    stim[46] = 44'h7a8533033da;
    stim[47] = 44'h2c0dfc4d9ae;
    stim[48] = 44'h251b48e1f7e;
    stim[49] = 44'h01634662603;
    stim[50] = 44'h642a1fbd12a;
    stim[51] = 44'h4e4152b8905;
    stim[52] = 44'h470c7b14c63;
    stim[53] = 44'hb20f3352e1a;
    stim[54] = 44'h7c872904814;
    stim[55] = 44'h52df7517883;
    stim[56] = 44'h1de3dcd643a;
    stim[57] = 44'h70435907fbf;
    stim[58] = 44'h73e960b1512;
    stim[59] = 44'h16bfe55ed03;
    stim[60] = 44'h552261a8700;
    stim[61] = 44'h540a23ec746;
    stim[62] = 44'h700afb8773d;
    stim[63] = 44'h4079e494cf8;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'hf;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'hf;
      expv[8] = 4'h4;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h1;
      expv[15] = 4'hb;
      expv[16] = 4'hf;
      expv[17] = 4'h5;
      expv[18] = 4'ha;
      expv[19] = 4'hc;
      expv[20] = 4'hd;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'hf;
      expv[25] = 4'h0;
      expv[26] = 4'hf;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'hf;
      expv[30] = 4'hf;
      expv[31] = 4'he;
      expv[32] = 4'h0;
      expv[33] = 4'hf;
      expv[34] = 4'h8;
      expv[35] = 4'hf;
      expv[36] = 4'h0;
      expv[37] = 4'h8;
      expv[38] = 4'h0;
      expv[39] = 4'h5;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h6;
      expv[45] = 4'h0;
      expv[46] = 4'h1;
      expv[47] = 4'h1;
      expv[48] = 4'hf;
      expv[49] = 4'h0;
      expv[50] = 4'h5;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h3;
      expv[54] = 4'h3;
      expv[55] = 4'h0;
      expv[56] = 4'hf;
      expv[57] = 4'h0;
      expv[58] = 4'hf;
      expv[59] = 4'h0;
      expv[60] = 4'hf;
      expv[61] = 4'hf;
      expv[62] = 4'h0;
      expv[63] = 4'hf;
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
