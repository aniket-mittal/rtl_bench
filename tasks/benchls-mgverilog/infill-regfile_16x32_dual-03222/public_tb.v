// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03222 dut (
    .clock(clk),
    .io_w_addr(in_vec[40:37]),
    .io_w_data(in_vec[36:5]),
    .io_w_en(in_vec[4:4]),
    .io_r_addr(in_vec[3:0]),
    .io_output_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h1009aeee054;
    stim[1] = 41'h12a1421a98f;
    stim[2] = 41'h1f120e3462c;
    stim[3] = 41'h117744077d3;
    stim[4] = 41'h0a189084ae5;
    stim[5] = 41'h1feae846fd8;
    stim[6] = 41'h1fe5229f32e;
    stim[7] = 41'h0ccbe297e5a;
    stim[8] = 41'h1390df1d278;
    stim[9] = 41'h0307104cddf;
    stim[10] = 41'h1e35e24ee19;
    stim[11] = 41'h1f3a1683220;
    stim[12] = 41'h186cdb44b17;
    stim[13] = 41'h1fe13a1f712;
    stim[14] = 41'h18c686889e8;
    stim[15] = 41'h0aad294f261;
    stim[16] = 41'h18bfa2c47fd;
    stim[17] = 41'h03ba2fce280;
    stim[18] = 41'h1b9a4209d9a;
    stim[19] = 41'h06f384e3dd7;
    stim[20] = 41'h141019628e1;
    stim[21] = 41'h12dac3c4987;
    stim[22] = 41'h01db9909452;
    stim[23] = 41'h0decb56ce9e;
    stim[24] = 41'h013b24f2420;
    stim[25] = 41'h18fc587c550;
    stim[26] = 41'h09536a9850b;
    stim[27] = 41'h0ddeae8fabd;
    stim[28] = 41'h1fdd53208ca;
    stim[29] = 41'h009e0817c0f;
    stim[30] = 41'h13dd2cdeabb;
    stim[31] = 41'h0cb75c2b611;
    stim[32] = 41'h030c458789d;
    stim[33] = 41'h0a7c4454355;
    stim[34] = 41'h08992036306;
    stim[35] = 41'h03eb0205bbb;
    stim[36] = 41'h15f98b8ea37;
    stim[37] = 41'h0ca46f6bb94;
    stim[38] = 41'h01b2aa52e7b;
    stim[39] = 41'h0d20f4ee971;
    stim[40] = 41'h1b0258cb66c;
    stim[41] = 41'h0f55431ebd7;
    stim[42] = 41'h10c8ffe8f09;
    stim[43] = 41'h1cead075c95;
    stim[44] = 41'h0e10ae7a4c3;
    stim[45] = 41'h0d3e55024c9;
    stim[46] = 41'h1f291d546a8;
    stim[47] = 41'h0ed0f4bdeae;
    stim[48] = 41'h04034c867de;
    stim[49] = 41'h033d0740b71;
    stim[50] = 41'h1fbfabd12fa;
    stim[51] = 41'h030ec9f6765;
    stim[52] = 41'h05b40993e90;
    stim[53] = 41'h163deb409b9;
    stim[54] = 41'h05007c32c0c;
    stim[55] = 41'h01421543ac6;
    stim[56] = 41'h050160c37bb;
    stim[57] = 41'h1c82a26eb7f;
    stim[58] = 41'h1c20ae2a0ee;
    stim[59] = 41'h16b288c993d;
    stim[60] = 41'h1089d171aba;
    stim[61] = 41'h0ed4dfe2091;
    stim[62] = 41'h0b011260b8e;
    stim[63] = 41'h0796ecb5a08;
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
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hbba203be;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hbba203be;
      expv[9] = 32'hf574237e;
      expv[10] = 32'hc86f8e93;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hbba203be;
      expv[15] = 32'h8388266e;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'h8388266e;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hedcc84a2;
      expv[25] = 32'hedcc84a2;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hcd2104ec;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hf09d0fb8;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'h8388266e;
      expv[32] = 32'hcd2104ec;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'h5bae15b0;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'hf58102dd;
      expv[40] = 32'h7e2c3e2a;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hee966f55;
      expv[43] = 32'h3e222a1a;
      expv[44] = 32'h79c271ee;
      expv[45] = 32'hee966f55;
      expv[46] = 32'hbba203be;
      expv[47] = 32'h75683ae4;
      expv[48] = 32'h75683ae4;
      expv[49] = 32'hf58102dd;
      expv[50] = 32'hfcc5c751;
      expv[51] = 32'h3e222a1a;
      expv[52] = 32'hd9552973;
      expv[53] = 32'hee966f55;
      expv[54] = 32'h7e2c3e2a;
      expv[55] = 32'h907a774b;
      expv[56] = 32'h1ef5a04d;
      expv[57] = 32'hdfd5e897;
      expv[58] = 32'h4151375b;
      expv[59] = 32'hcd2104ec;
      expv[60] = 32'hfcc5c751;
      expv[61] = 32'h9e83a05b;
      expv[62] = 32'h4151375b;
      expv[63] = 32'h44e8b8d5;
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
