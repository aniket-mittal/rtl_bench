// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06960 dut (
    .clk(clk),
    .addr(in_vec[47:36]),
    .din(in_vec[35:4]),
    .byteExt(in_vec[3:2]),
    .wEn(in_vec[1:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h3c08250c6bc5;
    stim[1] = 48'hdd3a2b2814d1;
    stim[2] = 48'hec8c0bff51e1;
    stim[3] = 48'hf8e9813a476c;
    stim[4] = 48'hf4c3b7ff637b;
    stim[5] = 48'h9b9dfa712560;
    stim[6] = 48'h6ef32c094125;
    stim[7] = 48'h02f1072e5fd6;
    stim[8] = 48'hcfbfdac3edb1;
    stim[9] = 48'ha25790c88f3c;
    stim[10] = 48'hd7516203fd9b;
    stim[11] = 48'h4a17b3f93ddb;
    stim[12] = 48'h105c6f370b8e;
    stim[13] = 48'h5c1590bfa872;
    stim[14] = 48'he0e80ca53c67;
    stim[15] = 48'h616348bd218c;
    stim[16] = 48'hc4529f7a3944;
    stim[17] = 48'h847ffed229c6;
    stim[18] = 48'h0c3c228b9d9d;
    stim[19] = 48'hc95c3bd5991d;
    stim[20] = 48'h4b50c4c9e111;
    stim[21] = 48'hf387e38ac962;
    stim[22] = 48'h0822db3388eb;
    stim[23] = 48'h504af6c4d424;
    stim[24] = 48'hed33fa5bb80f;
    stim[25] = 48'hda51a23cfc21;
    stim[26] = 48'hf06a06b4bd6b;
    stim[27] = 48'hdaa08dc27c32;
    stim[28] = 48'h09237a27ca58;
    stim[29] = 48'h8b0bf9cd4bee;
    stim[30] = 48'h3886caf25e55;
    stim[31] = 48'h805d1b0aaa5b;
    stim[32] = 48'h3a27b78db09e;
    stim[33] = 48'hd172c70a424c;
    stim[34] = 48'h404547be4f38;
    stim[35] = 48'hce3556d4d76e;
    stim[36] = 48'hb312c80ceb93;
    stim[37] = 48'hd3e6a4b7faf1;
    stim[38] = 48'h0da90e7f17c0;
    stim[39] = 48'h83b2dc5383c7;
    stim[40] = 48'he17fe5ec7413;
    stim[41] = 48'hedfd16ba5f11;
    stim[42] = 48'hc1d75fb31bfd;
    stim[43] = 48'h1c66333810c2;
    stim[44] = 48'hd59f8c4765d7;
    stim[45] = 48'hcd6d8958a809;
    stim[46] = 48'hfc6ac58318c0;
    stim[47] = 48'h9c9f7174273d;
    stim[48] = 48'h83f376cd6df9;
    stim[49] = 48'h10d4a1f7de79;
    stim[50] = 48'he6efa00ffaf4;
    stim[51] = 48'h3ae1ca91d578;
    stim[52] = 48'h46d6e1930b41;
    stim[53] = 48'ha9ccf2616875;
    stim[54] = 48'hdc1d35502801;
    stim[55] = 48'h0b7275d13712;
    stim[56] = 48'hefcecc704702;
    stim[57] = 48'hbfd817e9497f;
    stim[58] = 48'hfad10dd0809a;
    stim[59] = 48'h854dd98656d3;
    stim[60] = 48'h3bcc59e493ce;
    stim[61] = 48'hf6866325c412;
    stim[62] = 48'h98428132afed;
    stim[63] = 48'hbd6532d916cf;
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
      expv[1] = 32'h000000xx;
      expv[2] = 32'h000000xx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'h000000xx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'h000000xx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'h000000xx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'h000000xx;
      expv[21] = 32'h000000xx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'h000000xx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'h000000xx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'h000000xx;
      expv[37] = 32'h000000xx;
      expv[38] = 32'h000000xx;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'h000000xx;
      expv[41] = 32'h000000xx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'h000000xx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'h000000xx;
      expv[47] = 32'hxxxxxxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'h000000xx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'h000000xx;
      expv[55] = 32'h000000xx;
      expv[56] = 32'h000000xx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'h000000xx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'h000000xx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
