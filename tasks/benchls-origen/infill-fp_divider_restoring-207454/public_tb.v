// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_207454 dut (
    .fp_clk(clk),
    .A(in_vec[64:33]),
    .B(in_vec[32:1]),
    .int_clk(in_vec[0:0]),
    .Out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h15cac12ccad96b1d2;
    stim[1] = 65'h01c4086610bdf9c4b;
    stim[2] = 65'h0397be16f6043c127;
    stim[3] = 65'h066dd235f7e841af9;
    stim[4] = 65'h07080a01b6a5c12ff;
    stim[5] = 65'h0409bafe9026e532b;
    stim[6] = 65'h01d1683df833ee518;
    stim[7] = 65'h0306fd052d762ee23;
    stim[8] = 65'h0865de2f579b08a30;
    stim[9] = 65'h060a35ef93eb0b1d3;
    stim[10] = 65'h193112664bc2c104f;
    stim[11] = 65'h136822c7c184c4ba3;
    stim[12] = 65'h1d0595ae39bade45e;
    stim[13] = 65'h100c21e4ea3e1894b;
    stim[14] = 65'h01cd37d227a6e84eb;
    stim[15] = 65'h063e69b2a583876c0;
    stim[16] = 65'h0e5b8f4a978335a44;
    stim[17] = 65'h0b8dd975425c2e8dd;
    stim[18] = 65'h16ccfcd896e381fb5;
    stim[19] = 65'h12826af6cc58b2830;
    stim[20] = 65'h0796bf4b6e80e578e;
    stim[21] = 65'h127a676062f279ea0;
    stim[22] = 65'h0618aec6601f0bf05;
    stim[23] = 65'h0b5f413d4a95a782d;
    stim[24] = 65'h148ad5fe1da465e9f;
    stim[25] = 65'h0aba04c965adb21f1;
    stim[26] = 65'h007b13e35f992fdad;
    stim[27] = 65'h1ef0ca6ed1d34a43c;
    stim[28] = 65'h07bc0b43b9a11210a;
    stim[29] = 65'h03ad11cd8ce246be1;
    stim[30] = 65'h1a0f371edd9ab9b38;
    stim[31] = 65'h02dbe099756c6ce26;
    stim[32] = 65'h04a39921599144a57;
    stim[33] = 65'h14bb900dde14c5eea;
    stim[34] = 65'h124c018ce112b840c;
    stim[35] = 65'h1f844e53bf8d4c085;
    stim[36] = 65'h16d1ac750f74d97e9;
    stim[37] = 65'h197804bb104027495;
    stim[38] = 65'h1b73599fc6b6c4809;
    stim[39] = 65'h1ef6c6791b20f9eda;
    stim[40] = 65'h114d4f24d717ff129;
    stim[41] = 65'h191ad39ef859ee38e;
    stim[42] = 65'h17375e9cf26e800a8;
    stim[43] = 65'h1e0f4955d0fc8ebe4;
    stim[44] = 65'h0dfc98811a229417f;
    stim[45] = 65'h1da7c334f0e0328cf;
    stim[46] = 65'h10ab41e2dec9034a9;
    stim[47] = 65'h054e34b7d9f17dbc9;
    stim[48] = 65'h182c01800d42b17f4;
    stim[49] = 65'h199fd4baeab7d1af8;
    stim[50] = 65'h0392b075cc977d046;
    stim[51] = 65'h1c35b2bb8e9a015c3;
    stim[52] = 65'h0d1edacc05090db14;
    stim[53] = 65'h07a86f2f265796255;
    stim[54] = 65'h1d63baa4d409d61c4;
    stim[55] = 65'h18cbd734265fbb73c;
    stim[56] = 65'h0f81a65207170b93c;
    stim[57] = 65'h174fb05d4a9079d61;
    stim[58] = 65'h19408bb2f9763f201;
    stim[59] = 65'h11ea114ea81b5a7be;
    stim[60] = 65'h0b24b6adee73fb848;
    stim[61] = 65'h1c57ad2293eb80f1e;
    stim[62] = 65'h16bbbec18bdb679dd;
    stim[63] = 65'h05fb2db5e524c2f93;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hc8800000;
      expv[2] = 32'hac800000;
      expv[3] = 32'hb4000000;
      expv[4] = 32'hc3000000;
      expv[5] = 32'hdf000000;
      expv[6] = 32'h8d000000;
      expv[7] = 32'h6c800000;
      expv[8] = 32'hc6800000;
      expv[9] = 32'hd1000000;
      expv[10] = 32'hab800000;
      expv[11] = 32'hcf000000;
      expv[12] = 32'h5a800000;
      expv[13] = 32'hee800000;
      expv[14] = 32'h11000000;
      expv[15] = 32'h45800000;
      expv[16] = 32'hf6800000;
      expv[17] = 32'h09800000;
      expv[18] = 32'h3f000000;
      expv[19] = 32'hf1800000;
      expv[20] = 32'h08800000;
      expv[21] = 32'hbc000000;
      expv[22] = 32'h70000000;
      expv[23] = 32'h46000000;
      expv[24] = 32'h77000000;
      expv[25] = 32'h68800000;
      expv[26] = 32'hc7000000;
      expv[27] = 32'h29000000;
      expv[28] = 32'hb0800000;
      expv[29] = 32'h76000000;
      expv[30] = 32'h23800000;
      expv[31] = 32'hab800000;
      expv[32] = 32'h98800000;
      expv[33] = 32'h75000000;
      expv[34] = 32'hc9800000;
      expv[35] = 32'h40000000;
      expv[36] = 32'hfb000000;
      expv[37] = 32'h09800000;
      expv[38] = 32'he6000000;
      expv[39] = 32'h5e800000;
      expv[40] = 32'h11800000;
      expv[41] = 32'h46000000;
      expv[42] = 32'h66800000;
      expv[43] = 32'h28800000;
      expv[44] = 32'hde800000;
      expv[45] = 32'h26000000;
      expv[46] = 32'h4f000000;
      expv[47] = 32'h9a800000;
      expv[48] = 32'h97000000;
      expv[49] = 32'hb7000000;
      expv[50] = 32'h78000000;
      expv[51] = 32'had000000;
      expv[52] = 32'h00800000;
      expv[53] = 32'h4a800000;
      expv[54] = 32'h0b000000;
      expv[55] = 32'hd3800000;
      expv[56] = 32'h03800000;
      expv[57] = 32'ha5800000;
      expv[58] = 32'h3e800000;
      expv[59] = 32'h8e800000;
      expv[60] = 32'h25800000;
      expv[61] = 32'h03800000;
      expv[62] = 32'h97000000;
      expv[63] = 32'h46800000;
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
