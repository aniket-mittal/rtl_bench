// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06142 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[66:66]),
    .ap_start(in_vec[65:65]),
    .ap_continue(in_vec[64:64]),
    .p_read(in_vec[63:0]),
    .ap_done(out_vec[66:66]),
    .ap_idle(out_vec[65:65]),
    .ap_ready(out_vec[64:64]),
    .ap_return(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h7074af89488348f28;
    stim[1] = 67'h4400d03cba88d4e1f;
    stim[2] = 67'h0605020d8185d9067;
    stim[3] = 67'h23edbf4352e975401;
    stim[4] = 67'h1d06a80fc23bd3084;
    stim[5] = 67'h2430cb6a6ab270a57;
    stim[6] = 67'h219ce580766d9cb49;
    stim[7] = 67'h37a2fd874c1495c16;
    stim[8] = 67'h0188be7ca2cc28d03;
    stim[9] = 67'h0fe430ef0efe9d564;
    stim[10] = 67'h290796cc13e5e458f;
    stim[11] = 67'h27f546063f6c0488e;
    stim[12] = 67'h358e9a90b64bc3a2b;
    stim[13] = 67'h3f74ab9b8b62cfe44;
    stim[14] = 67'h2e87a13f47e8ba592;
    stim[15] = 67'h1cdd6185cfaa34b76;
    stim[16] = 67'h07132ce4636d43c6b;
    stim[17] = 67'h2bc34d6bea1c5adb0;
    stim[18] = 67'h208df6ba645640bb3;
    stim[19] = 67'h180220a8e18c3257e;
    stim[20] = 67'h35b1bea44f2151bf9;
    stim[21] = 67'h2746849d013788a41;
    stim[22] = 67'h02db27e940a1f957e;
    stim[23] = 67'h2f33cdc4f6ec1808c;
    stim[24] = 67'h2e0f6ffc88679185d;
    stim[25] = 67'h3ba228c7959de7bff;
    stim[26] = 67'h067e2e9529f602457;
    stim[27] = 67'h00d1402be793b3ce9;
    stim[28] = 67'h3b42c984a2e52ed0f;
    stim[29] = 67'h037b6c85ca245396d;
    stim[30] = 67'h232a6fbb7dcca2dd3;
    stim[31] = 67'h0bbb739aa70e1ed28;
    stim[32] = 67'h38daff946c76ea068;
    stim[33] = 67'h0596d3ebef58e1f8e;
    stim[34] = 67'h1b600f5dd8609516a;
    stim[35] = 67'h05872d50622f3750b;
    stim[36] = 67'h2ab131c08ce2ddfeb;
    stim[37] = 67'h2f788499df528e79b;
    stim[38] = 67'h096b555fab32716e3;
    stim[39] = 67'h3070874feba1fa874;
    stim[40] = 67'h31306064126cdba52;
    stim[41] = 67'h15575235c5b5e8682;
    stim[42] = 67'h259021251ea96786f;
    stim[43] = 67'h077db25def387a6e9;
    stim[44] = 67'h000f8d398464580c3;
    stim[45] = 67'h13ab45855e144e5da;
    stim[46] = 67'h0725d9682caaedf90;
    stim[47] = 67'h097741eef8079e37c;
    stim[48] = 67'h0c611734353042840;
    stim[49] = 67'h3c087ff5bdef7ef6c;
    stim[50] = 67'h1846f5d14f3659676;
    stim[51] = 67'h1d98fc486f95ba806;
    stim[52] = 67'h32da7af19913123f8;
    stim[53] = 67'h3a2acfb0dbe05436e;
    stim[54] = 67'h2df409f75173f9d38;
    stim[55] = 67'h396b2237fd436ca3a;
    stim[56] = 67'h3af1efb5be728a4b0;
    stim[57] = 67'h178865c50bc75a3f3;
    stim[58] = 67'h1cf36bfe042211da0;
    stim[59] = 67'h27af7e3ed18645936;
    stim[60] = 67'h266ce54820cf024ee;
    stim[61] = 67'h2a5a3f27b55def401;
    stim[62] = 67'h1ee4cdf9ea4be799f;
    stim[63] = 67'h185a3e86792b4b861;
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
      expv[0] = 67'h5074af89488348f28;
      expv[1] = 67'h20000000000000000;
      expv[2] = 67'h20000000000000000;
      expv[3] = 67'h53edbf4352e975401;
      expv[4] = 67'h63edbf4352e975401;
      expv[5] = 67'h5430cb6a6ab270a57;
      expv[6] = 67'h4430cb6a6ab270a57;
      expv[7] = 67'h4430cb6a6ab270a57;
      expv[8] = 67'h2430cb6a6ab270a57;
      expv[9] = 67'h2430cb6a6ab270a57;
      expv[10] = 67'h590796cc13e5e458f;
      expv[11] = 67'h490796cc13e5e458f;
      expv[12] = 67'h490796cc13e5e458f;
      expv[13] = 67'h5f74ab9b8b62cfe44;
      expv[14] = 67'h5e87a13f47e8ba592;
      expv[15] = 67'h6e87a13f47e8ba592;
      expv[16] = 67'h2e87a13f47e8ba592;
      expv[17] = 67'h5bc34d6bea1c5adb0;
      expv[18] = 67'h4bc34d6bea1c5adb0;
      expv[19] = 67'h6bc34d6bea1c5adb0;
      expv[20] = 67'h55b1bea44f2151bf9;
      expv[21] = 67'h5746849d013788a41;
      expv[22] = 67'h6746849d013788a41;
      expv[23] = 67'h4746849d013788a41;
      expv[24] = 67'h4746849d013788a41;
      expv[25] = 67'h4746849d013788a41;
      expv[26] = 67'h2746849d013788a41;
      expv[27] = 67'h2746849d013788a41;
      expv[28] = 67'h5b42c984a2e52ed0f;
      expv[29] = 67'h2b42c984a2e52ed0f;
      expv[30] = 67'h532a6fbb7dcca2dd3;
      expv[31] = 67'h632a6fbb7dcca2dd3;
      expv[32] = 67'h432a6fbb7dcca2dd3;
      expv[33] = 67'h232a6fbb7dcca2dd3;
      expv[34] = 67'h232a6fbb7dcca2dd3;
      expv[35] = 67'h232a6fbb7dcca2dd3;
      expv[36] = 67'h5ab131c08ce2ddfeb;
      expv[37] = 67'h4ab131c08ce2ddfeb;
      expv[38] = 67'h6ab131c08ce2ddfeb;
      expv[39] = 67'h4ab131c08ce2ddfeb;
      expv[40] = 67'h51306064126cdba52;
      expv[41] = 67'h21306064126cdba52;
      expv[42] = 67'h559021251ea96786f;
      expv[43] = 67'h659021251ea96786f;
      expv[44] = 67'h659021251ea96786f;
      expv[45] = 67'h659021251ea96786f;
      expv[46] = 67'h259021251ea96786f;
      expv[47] = 67'h259021251ea96786f;
      expv[48] = 67'h259021251ea96786f;
      expv[49] = 67'h5c087ff5bdef7ef6c;
      expv[50] = 67'h2c087ff5bdef7ef6c;
      expv[51] = 67'h2c087ff5bdef7ef6c;
      expv[52] = 67'h52da7af19913123f8;
      expv[53] = 67'h5a2acfb0dbe05436e;
      expv[54] = 67'h5df409f75173f9d38;
      expv[55] = 67'h4df409f75173f9d38;
      expv[56] = 67'h5af1efb5be728a4b0;
      expv[57] = 67'h2af1efb5be728a4b0;
      expv[58] = 67'h2af1efb5be728a4b0;
      expv[59] = 67'h57af7e3ed18645936;
      expv[60] = 67'h47af7e3ed18645936;
      expv[61] = 67'h47af7e3ed18645936;
      expv[62] = 67'h67af7e3ed18645936;
      expv[63] = 67'h27af7e3ed18645936;
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
