// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06467 dut (
    .ACLK(clk),
    .ARESETN(in_vec[35:35]),
    .S_AXIS_TDATA(in_vec[34:3]),
    .S_AXIS_TLAST(in_vec[2:2]),
    .S_AXIS_TVALID(in_vec[1:1]),
    .M_AXIS_TREADY(in_vec[0:0]),
    .S_AXIS_TREADY(out_vec[38:38]),
    .M_AXIS_TVALID(out_vec[37:37]),
    .M_AXIS_TDATA(out_vec[36:5]),
    .M_AXIS_TLAST(out_vec[4:4]),
    .M_AXIS_TKEEP(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h2af8be8e5;
    stim[1] = 36'h7b503dc16;
    stim[2] = 36'h8b0115e8a;
    stim[3] = 36'hbc6f46238;
    stim[4] = 36'ha3764b175;
    stim[5] = 36'hbddbd24da;
    stim[6] = 36'h9192a83f7;
    stim[7] = 36'hb1c011730;
    stim[8] = 36'habc770c9d;
    stim[9] = 36'h9cd4f8d86;
    stim[10] = 36'h973d984db;
    stim[11] = 36'hc97ed184b;
    stim[12] = 36'hbd6bfd17f;
    stim[13] = 36'hb465c7d77;
    stim[14] = 36'hf8e1a619f;
    stim[15] = 36'he27b7f8e7;
    stim[16] = 36'h9e1697149;
    stim[17] = 36'hca40104d3;
    stim[18] = 36'hb12f66fb3;
    stim[19] = 36'hd075baaea;
    stim[20] = 36'hf0788154a;
    stim[21] = 36'h8da06930b;
    stim[22] = 36'h8bcc8b8c8;
    stim[23] = 36'h95889b287;
    stim[24] = 36'hdb9e04822;
    stim[25] = 36'hfa4efa81b;
    stim[26] = 36'ha006886f2;
    stim[27] = 36'hca9ded097;
    stim[28] = 36'hc1646742c;
    stim[29] = 36'hf0891a261;
    stim[30] = 36'h4c294c736;
    stim[31] = 36'he6f997050;
    stim[32] = 36'hcdb881e6b;
    stim[33] = 36'h8e163139c;
    stim[34] = 36'h8af0fc3cf;
    stim[35] = 36'hce822b9d2;
    stim[36] = 36'hcfc2486f8;
    stim[37] = 36'he5315ac17;
    stim[38] = 36'hd1890679c;
    stim[39] = 36'hefc6a6467;
    stim[40] = 36'h1709ebb53;
    stim[41] = 36'h54185763f;
    stim[42] = 36'hca4a062eb;
    stim[43] = 36'hd6f4b10bc;
    stim[44] = 36'hd4e55a17d;
    stim[45] = 36'ha4847b2a3;
    stim[46] = 36'hc4d4459f0;
    stim[47] = 36'h8b1c3bbc6;
    stim[48] = 36'hb97a3db85;
    stim[49] = 36'hffd065064;
    stim[50] = 36'hf74cef793;
    stim[51] = 36'ha8ce990bc;
    stim[52] = 36'he0bcbd5ef;
    stim[53] = 36'heb6a6337f;
    stim[54] = 36'ha59ad3a3f;
    stim[55] = 36'hf261a0a80;
    stim[56] = 36'hb1349cd0d;
    stim[57] = 36'hc042a1048;
    stim[58] = 36'hec334d803;
    stim[59] = 36'hf62cd35b6;
    stim[60] = 36'ha8d9ab488;
    stim[61] = 36'he2ed8c54f;
    stim[62] = 36'hc63dd9768;
    stim[63] = 36'hc6376578d;
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
      expv[0] = 39'h000000000f;
      expv[1] = 39'h000000000f;
      expv[2] = 39'h000000000f;
      expv[3] = 39'h400000000f;
      expv[4] = 39'h400000000f;
      expv[5] = 39'h400000000f;
      expv[6] = 39'h4f76f4936f;
      expv[7] = 39'h53db9ea32f;
      expv[8] = 39'h53db9ea32f;
      expv[9] = 39'h53db9ea32f;
      expv[10] = 39'h5b10dcd92f;
      expv[11] = 39'h40e042ec8f;
      expv[12] = 39'h533ff74daf;
      expv[13] = 39'h429af6938f;
      expv[14] = 39'h4fb468894f;
      expv[15] = 39'h2decd20faf;
      expv[16] = 39'h2decd20faf;
      expv[17] = 39'h2decd20faf;
      expv[18] = 39'h2decd20faf;
      expv[19] = 39'h2decd20faf;
      expv[20] = 39'h2decd20faf;
      expv[21] = 39'h2decd20faf;
      expv[22] = 39'h2decd20faf;
      expv[23] = 39'h2decd20faf;
      expv[24] = 39'h2decd20faf;
      expv[25] = 39'h2decd20faf;
      expv[26] = 39'h2decd20faf;
      expv[27] = 39'h2decd20faf;
      expv[28] = 39'h0decd20faf;
      expv[29] = 39'h0decd20faf;
      expv[30] = 39'h000000000f;
      expv[31] = 39'h000000000f;
      expv[32] = 39'h000000000f;
      expv[33] = 39'h400000000f;
      expv[34] = 39'h400000000f;
      expv[35] = 39'h42bc3f0f2f;
      expv[36] = 39'h565cc9f66f;
      expv[37] = 39'h565cc9f66f;
      expv[38] = 39'h4fa920a6af;
      expv[39] = 39'h4fa920a6af;
      expv[40] = 39'h000000000f;
      expv[41] = 39'h000000000f;
      expv[42] = 39'h000000000f;
      expv[43] = 39'h400000000f;
      expv[44] = 39'h400000000f;
      expv[45] = 39'h400000000f;
      expv[46] = 39'h49211eca8f;
      expv[47] = 39'h49211eca8f;
      expv[48] = 39'h4be82db98f;
      expv[49] = 39'h4be82db98f;
      expv[50] = 39'h4be82db98f;
      expv[51] = 39'h49bb6997cf;
      expv[52] = 39'h49bb6997cf;
      expv[53] = 39'h41ea98ef6f;
      expv[54] = 39'h5cc531bd4f;
      expv[55] = 39'h462be6a62f;
      expv[56] = 39'h462be6a62f;
      expv[57] = 39'h462be6a62f;
      expv[58] = 39'h462be6a62f;
      expv[59] = 39'h4138ba062f;
      expv[60] = 39'h3ec3eedcef;
      expv[61] = 39'h3ec3eedcef;
      expv[62] = 39'h3ec3eedcef;
      expv[63] = 39'h3ec3eedcef;
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
