// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 124;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_020570 dut (
    .sel_cntr_bytes1(in_vec[123:120]),
    .sel_cntr_bytes2(in_vec[119:116]),
    .sel_cntr_bytes3(in_vec[115:112]),
    .sel_cntr_bytes4(in_vec[111:108]),
    .cntr1_val_reg(in_vec[107:81]),
    .cntr2_val_reg(in_vec[80:54]),
    .cntr3_val_reg(in_vec[53:27]),
    .cntr4_val_reg(in_vec[26:0]),
    .cntr1_in_byte(out_vec[31:24]),
    .cntr2_in_byte(out_vec[23:16]),
    .cntr3_in_byte(out_vec[15:8]),
    .cntr4_in_byte(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 124'h04c0c9a523e4cff24825cd8d3843c12;
    stim[1] = 124'h61c70094fdcb7992502c7691bab5684;
    stim[2] = 124'h735291004ee788227d0aa74ce7b9d33;
    stim[3] = 124'h0be880c936f36117dda0b4d8735b39d;
    stim[4] = 124'hf6d5597977918a3af77a46e27780952;
    stim[5] = 124'hbb6135eff3c7d6e2e41cc58c1eee7c5;
    stim[6] = 124'hcd14eb167ede40529665c659c0d0418;
    stim[7] = 124'h6b901049998de46f30455a123eff4a3;
    stim[8] = 124'hd41b72d23a51214dcbd5b5b470e3579;
    stim[9] = 124'hc48dff1b37048e89ec08553e5eecb42;
    stim[10] = 124'hc3d35f8a5419285d9acab245f303b56;
    stim[11] = 124'h7084e538598681f1459dd5588d3d408;
    stim[12] = 124'h68c1932ab105d5a1257cc98d2ade896;
    stim[13] = 124'h747366e60682705df1540b3d0214340;
    stim[14] = 124'h265d2cd08b04d01feeeef32e88081b2;
    stim[15] = 124'hec3faa8c7da556122b825f7d6592cf2;
    stim[16] = 124'h4c990cf0546e87c9855588f4fe46ed7;
    stim[17] = 124'hae461649a0bd75e9737a07b259793bc;
    stim[18] = 124'he9c73a60a139b26c43f1e7da3ae195d;
    stim[19] = 124'hd34fd8eff9a1addffe0078771991302;
    stim[20] = 124'h82820882c23a7442919a81bf726fc59;
    stim[21] = 124'h8c65690bbf191fa243b2b7ef7f96e70;
    stim[22] = 124'h6c6a878edff9f40c10381e79a56c709;
    stim[23] = 124'h2e81a13a69dffafb28e38de17355690;
    stim[24] = 124'hc90d559b560f5893d6f92e255e2339e;
    stim[25] = 124'h4d9db0a6f7b8990144ef93eb226ecd4;
    stim[26] = 124'h06ec0e6a8f5af531de68d634500e670;
    stim[27] = 124'hc8864adef9993847f954cb0201d140f;
    stim[28] = 124'he0563315dabb93d89749077306c6966;
    stim[29] = 124'h4bfcfb3c9c95e2ca041675e744efa27;
    stim[30] = 124'hb3aab00d7ec25dc05856f21962bcec3;
    stim[31] = 124'h0a5fc93094ccddd579bcb52000782a9;
    stim[32] = 124'hbc6a5675b89d6f4b7c4406edc62cd3c;
    stim[33] = 124'h7e15a3fb8fb96dc3a06e1405ecafa4b;
    stim[34] = 124'he43435467bde034854695ba7cfd41b7;
    stim[35] = 124'he67e44017736c9fe589dfdc4390a364;
    stim[36] = 124'h23ef6f936b569dd782fe119ff54c354;
    stim[37] = 124'h8bf6aca113c879b3859973291ed94a1;
    stim[38] = 124'h29fc7d6a26aa53b31324faa330a6640;
    stim[39] = 124'h5922ef58b5e9676d563a347f866c0b9;
    stim[40] = 124'h475e0bb44aa75826787fa9b371bdb97;
    stim[41] = 124'h6cb2e5b74d94942dc8598ae97d81b4f;
    stim[42] = 124'h8102630b27afdfc66a591ba530d1632;
    stim[43] = 124'hc3fbd5a343e03bac138ddf1da2da63a;
    stim[44] = 124'hb3877791f2040fb2e12f98faaece494;
    stim[45] = 124'h9e9f25aa68de25d22215a0bffa9e27b;
    stim[46] = 124'h9a25ec1047b351dcd7863a728ad0947;
    stim[47] = 124'h576350012d4f19b6ef0979afba19a66;
    stim[48] = 124'h7deb46c684f1b8fd9f4c5e0dacdd071;
    stim[49] = 124'hbd8c5880f32d2983109ac77110e0143;
    stim[50] = 124'hf3790a050a65460feb3ae0b3848b624;
    stim[51] = 124'hccb7a5361e22a90983c0840499127f7;
    stim[52] = 124'hfed8fb3312ae41964267cc25e5a9b75;
    stim[53] = 124'hd094a17cbbfc6f574dda8209bb61e2f;
    stim[54] = 124'h7ab4268278be851d05d0fdefeca54d3;
    stim[55] = 124'h9a602d48e85263fbcd28f56005c6181;
    stim[56] = 124'h274a6ab3d6a0859773e38ae48a0ef8d;
    stim[57] = 124'h6c2dc1e682847cb6774ac90396f63ea;
    stim[58] = 124'h1a83d6e5b670a5eaffaf095307eb9c5;
    stim[59] = 124'h06cd78bd7a73e84f088b606b8caef90;
    stim[60] = 124'hbe93e8718d20e4cc0e13dcb5c1b716f;
    stim[61] = 124'hbfd89516c7582d12a90e6aa4f870d1b;
    stim[62] = 124'h3894944a391bab761c65c1419df31be;
    stim[63] = 124'h2170de44e3481a43e040248518502ac;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxx03;
      expv[2] = 32'h04xxxxxx;
      expv[3] = 32'hxxd8b0xx;
      expv[4] = 32'hxxxx8d0x;
      expv[5] = 32'haff5xxxx;
      expv[6] = 32'hxx14xxxx;
      expv[7] = 32'hxx79xxxx;
      expv[8] = 32'h91xxxx0e;
      expv[9] = 32'hxxxxxxcb;
      expv[10] = 32'hxxxx64xx;
      expv[11] = 32'h07xxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'h03xx02xx;
      expv[14] = 32'hxxxxxx81;
      expv[15] = 32'hed8x0xxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxx5cxxxx;
      expv[18] = 32'h09xxxx03;
      expv[19] = 32'h7fxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxx0xxxxx;
      expv[23] = 32'hxxcaxxxx;
      expv[24] = 32'hxxxxxx33;
      expv[25] = 32'hxx40xxec;
      expv[26] = 32'hxxxx68xx;
      expv[27] = 32'hxxxxxx0x;
      expv[28] = 32'hd5xx0xxx;
      expv[29] = 32'hxx78xxxx;
      expv[30] = 32'h80xxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hb3dxxxxx;
      expv[33] = 32'h05e8xxxx;
      expv[34] = 32'hdexxxxxx;
      expv[35] = 32'hb9xx0164;
      expv[36] = 32'hxxxx3fxx;
      expv[37] = 32'hxx1exxx1;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'hxx01xx97;
      expv[41] = 32'hxxxxb3xx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'h1x0xxx2d;
      expv[44] = 32'hbc0xxx02;
      expv[45] = 32'hxx88xxxx;
      expv[46] = 32'hxxxxxx0x;
      expv[47] = 32'h0x03xxxx;
      expv[48] = 32'h023f1bcd;
      expv[49] = 32'hc460xxxx;
      expv[50] = 32'hxxx106xx;
      expv[51] = 32'hxxxx8101;
      expv[52] = 32'hxx9098xx;
      expv[53] = 32'he5xxxxxx;
      expv[54] = 32'h01x1a1xx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxx00xxxx;
      expv[57] = 32'hxxxdxx63;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxef;
      expv[60] = 32'h4303xxxx;
      expv[61] = 32'ha8xxd5xx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxx00xx;
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
