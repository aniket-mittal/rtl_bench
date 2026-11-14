// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 145;
  localparam OW = 100;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_022909 dut (
    .cmd_type_bus(in_vec[144:137]),
    .cmd_op_memory(in_vec[136:129]),
    .exu_pause(in_vec[128:128]),
    .exu_rs1_data(in_vec[127:96]),
    .exu_rs2_data(in_vec[95:64]),
    .exu_imm32(in_vec[63:32]),
    .lsu_load_data(in_vec[31:0]),
    .lsu_store_addr(out_vec[99:68]),
    .lsu_store_en(out_vec[67:67]),
    .lsu_store_data(out_vec[66:35]),
    .lsu_store_size(out_vec[34:33]),
    .lsu_rd_valid(out_vec[32:32]),
    .lsu_rd_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 145'h0fb4a6b25bda16080475bf81504ab8539077f;
    stim[1] = 145'h1eb82a591edd599da65cc8220d1fbd5e61b05;
    stim[2] = 145'h06e789808a10344a3322c7dda439318dcc05f;
    stim[3] = 145'h0277ce53b7a1296d02b9b70e52cdb6fa1f643;
    stim[4] = 145'h0849d10f9e04ed1e81696743a88aeb012ddb4;
    stim[5] = 145'h044434f26dd89ae25a5cf780842aec1d88ad6;
    stim[6] = 145'h16ce1f3b651c34ae57c155dc81b001ab3e073;
    stim[7] = 145'h08def50e44e090ff7bd42afb3bc20ca9ed5df;
    stim[8] = 145'h05e24dbfeaadb8aeb75f94e37acc6c700c274;
    stim[9] = 145'h1af4ff400c95c106826516b0eac952ba3132e;
    stim[10] = 145'h12a888c3a3b6cdbdb09a5a44794a188fb0c78;
    stim[11] = 145'h1bce2a06fd69d8f2c920e704bf0cb6169136e;
    stim[12] = 145'h05243ac35fc34a7afaa6a9abeeb127757ba9e;
    stim[13] = 145'h1a4c0399ab8c15973e1c62a9d46c2b5c0012d;
    stim[14] = 145'h1a21869099a089c982d1433390a289ec1332d;
    stim[15] = 145'h10568eeb1a295d4c0c57f71fbe222ba306e13;
    stim[16] = 145'h018c386fa256b4457918781d68c91b40928df;
    stim[17] = 145'h1d71fd6028541d3205a788309f34b264245bc;
    stim[18] = 145'h0b0aba542fe3b9d7099adc57b9e5681e160b0;
    stim[19] = 145'h08215b72343f8c5a2d5679e2d122549e44ee1;
    stim[20] = 145'h14062f2fa29bba848acbb60ec344fe0a44b49;
    stim[21] = 145'h1af88fa5cb1d6d755ba27290cb0ef3b334bf5;
    stim[22] = 145'h1809b64eedf105c472dc50b1cb764bce2a915;
    stim[23] = 145'h14f098739c9cfc85b5a8584216ab58eef0788;
    stim[24] = 145'h0a22b194a510e0d9543c5d62cd5adfb0c2935;
    stim[25] = 145'h1c51904c1e30c94234b7a60671a7acf295cf6;
    stim[26] = 145'h0db125734833f0a7f045551a05259635ebc47;
    stim[27] = 145'h0b377c1c8eff4b79674f024d28a5d8822c4be;
    stim[28] = 145'h0df38695f321d76500e675f556877c68fe5f9;
    stim[29] = 145'h0763b35fc353c3cc53d3467ab5ebb1b9cc702;
    stim[30] = 145'h193358a89f24b64209419abf018ef747750c7;
    stim[31] = 145'h1366d799980e07e08584f8f32828ef19aee55;
    stim[32] = 145'h092860437fe2b63056ebd961bc96c24d7e611;
    stim[33] = 145'h009ad5902de036c04f14a2834ad49e97cf44c;
    stim[34] = 145'h1d2721bea62ffa5c7c5d0dc041615549e9d76;
    stim[35] = 145'h1d6eea26cd9884fad497ba81c3294c058cf54;
    stim[36] = 145'h058f6499a1e8403e8a2e40436e8a0e77b786f;
    stim[37] = 145'h1e427263173d9c17af447add117091c7e4738;
    stim[38] = 145'h1df7047b37c45e8c05f2bfb52aee44fac5626;
    stim[39] = 145'h0e446f883f1ce79fa405f73dca05e6c557327;
    stim[40] = 145'h1773d2f3246d7457b3cd0272aa3ddd30ac1b1;
    stim[41] = 145'h0dcad9a3e2c46e45c5e0ed53baf8c585a5bd5;
    stim[42] = 145'h0e80b3678b79c309cfd8c7414fe6d822a62c4;
    stim[43] = 145'h12f2b30fb625bf63342b6d124380b728bc55e;
    stim[44] = 145'h17df04a85303b1c91dea4c1e1b187f7dfe251;
    stim[45] = 145'h1105f4b1ded6251b8d64bc592bccc44f4bd36;
    stim[46] = 145'h1656220e7c16fe8e21e99d79f2992569679ce;
    stim[47] = 145'h1390e2aca0750a2541191d388b9fe5fd25457;
    stim[48] = 145'h14b7d6281d9c61f38a4e9d72b6cd9eea6b36b;
    stim[49] = 145'h01164236408a038dde65c4a1a862dff3e79b8;
    stim[50] = 145'h1ac589810912424e126df7734bb1a216d879d;
    stim[51] = 145'h1e1877c56904895242a0f0f03f09d78a9f299;
    stim[52] = 145'h146c114a830dd5ab9e71d3f5e58206299dd92;
    stim[53] = 145'h0279978fbfebed9add52898a7dad30a923ffb;
    stim[54] = 145'h1b0e88054ee220a16078ee2b046aee626359b;
    stim[55] = 145'h142b6d75f8c937fecf67a08bc8e736eaa86c1;
    stim[56] = 145'h039cc608bb1063b13e64d35b82f95cf9d7900;
    stim[57] = 145'h05fc7e3480bfbaeabdff0d4862ad03e2d9696;
    stim[58] = 145'h0c4a6ca5eac04064338ed259b59c320e22dd7;
    stim[59] = 145'h0c4a647d7fc2a88b594e37ae349db53433a00;
    stim[60] = 145'h179442a8392abde63c50ae670e91b9aa36a63;
    stim[61] = 145'h0e94bb839f33c0cf8254451295f92b3e8e7c2;
    stim[62] = 145'h1eb1b7d2344ce9634d306d1b4767ad49434cf;
    stim[63] = 145'h1052f2a262f98ec063137596976656336f767;
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
      expv[0] = 100'h633ac24cbdedafad800000000;
      expv[1] = 100'h27b2bfd0cced32e6400000000;
      expv[2] = 100'h15e2e49696161616118dcc05f;
      expv[3] = 100'h5620a6ed0000000016fa1f643;
      expv[4] = 100'h853468fc000000001ffffddb4;
      expv[5] = 100'hc72f2037000000001c1d88ad6;
      expv[6] = 100'h517e6cc3000000001ffffe073;
      expv[7] = 100'h00980a297ffbffa11ffffffdf;
      expv[8] = 100'h2a3657a1bafcbafcb00000074;
      expv[9] = 100'h5f0f75f13bbcbba892ba3132e;
      expv[10] = 100'h3081d00dd2d2d2d2800000000;
      expv[11] = 100'h10bbc768c796490756169136e;
      expv[12] = 100'h46f4e74600000000000000000;
      expv[13] = 100'h6437ff83000000001b5c0012d;
      expv[14] = 100'h9c42a43000000000000000000;
      expv[15] = 100'h60ad84b7000000001ba306e13;
      expv[16] = 100'h08d0b1fc222bc8c3c00000000;
      expv[17] = 100'h590c788c000000001ffffffbc;
      expv[18] = 100'h6abe9c9100000000000000000;
      expv[19] = 100'h5550561d00000000000000000;
      expv[20] = 100'h53e65e0a00000000000000000;
      expv[21] = 100'h236962c5939393939fffffff5;
      expv[22] = 100'h700b967400000000000000000;
      expv[23] = 100'h0b5b348442c2c2c29ffffff88;
      expv[24] = 100'hef7726bb00000000000000000;
      expv[25] = 100'h6528fd86000000001fffffff6;
      expv[26] = 100'ha8d4d598853f822ac00000000;
      expv[27] = 100'he69b7a5100000000000000000;
      expv[28] = 100'hc8b49a94b3b3b3b39fffffff9;
      expv[29] = 100'h9da793f70000000010000c702;
      expv[30] = 100'h367a0b3a00000000000000000;
      expv[31] = 100'h08cc036e000000001f19aee55;
      expv[32] = 100'h9a53c79700000000000000000;
      expv[33] = 100'h81378b4c7da57da5000000000;
      expv[34] = 100'hf7ee791400000000000000000;
      expv[35] = 100'h4a890c1c000000001ffffcf54;
      expv[36] = 100'h4dd10724d1f65172200000000;
      expv[37] = 100'hd4028ae200000000100000038;
      expv[38] = 100'h43062b290000000014fac5626;
      expv[39] = 100'h6c60922c0000000016c557327;
      expv[40] = 100'h565ceab4000000001ffffffb1;
      expv[41] = 100'h6f79dbd22f072f07100005bd5;
      expv[42] = 100'haa8db6095e4e7ec6000000000;
      expv[43] = 100'h021f9a667b5bfb5b10000005e;
      expv[44] = 100'h0c66e1c2000000001ffffe251;
      expv[45] = 100'h10b0aa2e00000000000000000;
      expv[46] = 100'hf886eb01000000001ffffffce;
      expv[47] = 100'hfe52c14ed9eac8c8800000000;
      expv[48] = 100'h39ad469f76f4f6f4800000000;
      expv[49] = 100'h6d7e8ecd00000000000000000;
      expv[50] = 100'h0f454c3eefefefef9216d879d;
      expv[51] = 100'h8b5a80e500000000000000000;
      expv[52] = 100'h540688fd000000001ffffdd92;
      expv[53] = 100'h11a3d991000000001fffffffb;
      expv[54] = 100'h630534d000000000000000000;
      expv[55] = 100'he01c1b0600000000000000000;
      expv[56] = 100'h9643e09bf7a6f7a6800000000;
      expv[57] = 100'hb7ce36cb7ffdeff83ffffff96;
      expv[58] = 100'heffa05c700000000100002dd7;
      expv[59] = 100'hc2bb460500000000100003a00;
      expv[60] = 100'h10f47bc6e2856285200000000;
      expv[61] = 100'h096352ce267e32a2000000000;
      expv[62] = 100'h4ed7bb484b1b6b83000000000;
      expv[63] = 100'h838fa5fd00000000100000067;
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
